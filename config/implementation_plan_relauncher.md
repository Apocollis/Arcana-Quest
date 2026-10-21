# Implementation Plan - Update Cleanroom Relauncher Config for Java 21

Update `config/relauncher.json` to make Cleanroom Relauncher target Java 21 and enable zero-setup portability for pack distribution and test launching.

## Proposed Changes

### Configuration
#### [relauncher.json](file:///c:/Users/hughe/curseforge/minecraft/Instances/Arcana%20Quest%20DEVBOX/config/relauncher.json)
- Set `"targetJavaVersion": 21`
- Set `"targetVendor": "Adoptium"`
- Clear `"javaPath": ""` (enabling automatic portable provisioning instead of hardcoded local path)
- Keep Cleanroom locked at `"selectedVersion": "0.6.13-alpha"` and `"fetchUpdates": false`
- Maintain JVM arguments, including `-XX:-UseCompactObjectHeaders` and the Thaumcraft compilation command exclusion, while omitting fixed `-Xms8192m` to allow flexible launcher memory settings.

## Verification Plan
1. Inspect `config/relauncher.json` to verify valid JSON formatting.
2. Confirm settings match Java 21 portable spec.
3. User runs a test launch from the launcher to verify automatic Cleanroom 0.6.13-alpha + Java 21 relaunch behavior.
