#!/usr/bin/env node
/* eslint-disable no-console */

/**
 * build_svellheim_montage_tests_pack.js
 *
 * Reads montage test JSON files from data/montage-tests/ and writes them
 * into a LevelDB compendium pack at module/packs/svellheim-act3-montage-tests/.
 *
 * Each item gets a deterministic _id derived from its filename so that
 * compendium UUIDs remain stable across rebuilds.
 *
 * Usage:
 *   node tools/build_svellheim_montage_tests_pack.js
 */

const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');

// ── Paths ──────────────────────────────────────────────────────────────
const REPO_ROOT = process.cwd();
const MODULE_DIR = path.join(REPO_ROOT, 'module');
const SOURCE_DIR = path.join(REPO_ROOT, 'data', 'montage-tests');
const PACK_NAME = 'svellheim-act3-montage-tests';
const PACK_DIR = path.join(MODULE_DIR, 'packs', PACK_NAME);
const MODULE_ID = 'svellheim-act3';

// ── Deterministic ID helpers ───────────────────────────────────────────
const B62 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

function base62FromBuffer(buf, length) {
  let n = BigInt('0x' + Buffer.from(buf).toString('hex'));
  const base = BigInt(B62.length);
  let out = '';
  while (n > 0n) {
    out = B62[Number(n % base)] + out;
    n /= base;
  }
  if (out.length < length) out = out.padStart(length, '0');
  if (out.length > length) out = out.slice(0, length);
  return out;
}

function foundryIdFromSeed(seed) {
  const digest = crypto.createHash('sha1').update(String(seed)).digest();
  return base62FromBuffer(digest.subarray(0, 12), 16);
}

// ── LevelDB writer ────────────────────────────────────────────────────

async function writeLevelDb(items, outDir) {
  const { ClassicLevel } = require('classic-level');

  fs.rmSync(outDir, { recursive: true, force: true });
  fs.mkdirSync(outDir, { recursive: true });

  const db = new ClassicLevel(outDir, { keyEncoding: 'utf8', valueEncoding: 'utf8' });
  await db.open();

  for (const item of items) {
    await db.put(`!items!${item._id}`, JSON.stringify(item));
  }

  await db.compactRange('\x00', '\xff');
  await db.close();
}

// ── Main ──────────────────────────────────────────────────────────────

async function main() {
  if (!fs.existsSync(SOURCE_DIR)) {
    console.error(`Source directory not found: ${SOURCE_DIR}`);
    process.exit(1);
  }

  const jsonFiles = fs.readdirSync(SOURCE_DIR).filter(f => f.endsWith('.json')).sort();
  console.log(`Found ${jsonFiles.length} montage test files in ${path.relative(REPO_ROOT, SOURCE_DIR)}/\n`);

  const items = [];

  for (const file of jsonFiles) {
    const filePath = path.join(SOURCE_DIR, file);
    const raw = JSON.parse(fs.readFileSync(filePath, 'utf8'));

    const stem = path.basename(file, '.json');
    const _id = foundryIdFromSeed(`item:${PACK_NAME}:${stem}`);

    raw._id = _id;
    raw.folder = null;

    // Ensure _stats
    raw._stats = raw._stats || {};
    raw._stats.coreVersion = raw._stats.coreVersion || '13';
    raw._stats.systemId = raw._stats.systemId || 'draw-steel';
    raw._stats.systemVersion = raw._stats.systemVersion || null;
    raw._stats.createdTime = raw._stats.createdTime || Date.now();
    raw._stats.modifiedTime = null;
    raw._stats.lastModifiedBy = null;

    raw.ownership = raw.ownership || { default: 0 };
    raw.effects = raw.effects || [];
    raw.flags = raw.flags || {};

    items.push(raw);
    console.log(`  ${raw.name} → ${_id}`);
  }

  await writeLevelDb(items, PACK_DIR);

  console.log(
    `\nWrote pack: ${path.relative(REPO_ROOT, PACK_DIR)} (${items.length} montage tests)`
  );
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
