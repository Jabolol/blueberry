#!/usr/bin/env -S deno run --allow-read --allow-env

const data = new TextDecoder().decode(
  await Deno.readFile("./coding-style-reports.log"),
);

type Metadata = { errors: number; skipped: number };

const { errors, skipped } = data.trim().split("\n").reduce<Metadata>(
  (acc, val) => {
    const [path, ...raw] = val.split(": ");
    const message = raw.join(" ");
    const [file, line] = path.split(":");
    const severity = message.split(":")[0];
    switch (severity) {
      case "MAJOR":
      case "MINOR": {
        acc.errors += 1;
        console.log(`::error file=${file},line=${line}::${message}`);
        break;
      }
      case "INFO": {
        acc.skipped += 1;
        console.log(`::warning file=${file},line=${line}::${message}`);
        break;
      }
      default: {
        acc.skipped += 1;
        console.log(`::notice file=${file},line=${line}::${message}`);
        break;
      }
    }
    return acc;
  },
  { errors: 0, skipped: 0 },
);

if (errors > 0) {
  Deno.exit(1);
}

console.log(`::notice::Success, no coding styles. Skipped ${skipped} warns.`);
