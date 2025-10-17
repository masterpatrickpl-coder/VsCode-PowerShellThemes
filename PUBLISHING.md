# Publishing Guide for PowerShell Themes Extension

## Prerequisites

1. **Create a Publisher Account**
   - Go to https://marketplace.visualstudio.com/manage
   - Sign in with your Microsoft/Azure account
   - Create a publisher ID (if you haven't already)
   - Update `package.json` with your publisher ID if different from "masterpatrickpl"

2. **Get Personal Access Token**
   - Go to https://dev.azure.com/
   - Click on "User settings" → "Personal access tokens"
   - Create new token with:
     - Organization: All accessible organizations
     - Expiration: Custom (choose appropriate duration)
     - Scopes: Marketplace → Manage

## Publishing Steps

### Option 1: Using vsce (Recommended)

```bash
# Install vsce if not already installed
npm install -g @vscode/vsce

# Login to the marketplace (use your personal access token)
vsce login <publisher-name>

# Publish the extension
vsce publish
```

### Option 2: Using VSIX File

```bash
# Package the extension
vsce package

# Upload manually
# 1. Go to https://marketplace.visualstudio.com/manage
# 2. Click your publisher
# 3. Click "New Extension" → "Visual Studio Code"
# 4. Upload the .vsix file (powershell-themes-1.0.0.vsix)
```

### Option 3: GitHub Release

```bash
# Create a GitHub release
# 1. Go to your repository on GitHub
# 2. Click "Releases" → "Create a new release"
# 3. Tag version: v1.0.0
# 4. Release title: PowerShell Themes v1.0.0
# 5. Upload powershell-themes-1.0.0.vsix as an asset
# 6. Add release notes from CHANGELOG.md
```

## Pre-Publication Checklist

- [ ] Test extension locally with `code --install-extension powershell-themes-1.0.0.vsix`
- [ ] Verify all themes work correctly
- [ ] Check syntax highlighting with example.ps1
- [ ] Verify terminal colors are correct
- [ ] Test on both dark and light OS themes
- [ ] Update version number in package.json if needed
- [ ] Update CHANGELOG.md with release notes
- [ ] Create screenshots for marketplace listing
- [ ] Review README.md for accuracy
- [ ] Verify icon displays correctly
- [ ] Check repository URL in package.json
- [ ] Ensure LICENSE file is present

## Adding Screenshots

For better marketplace presentation, add screenshots:

```bash
# Create a screenshots directory
mkdir screenshots

# Take screenshots of:
# 1. PowerShell Dark theme with example code
# 2. PowerShell Light theme with example code
# 3. PowerShell Blue theme with example code
# 4. Terminal with PowerShell colors

# Reference them in README.md
```

## Updating the Extension

When you need to publish an update:

```bash
# 1. Update version in package.json
# 2. Update CHANGELOG.md with new changes
# 3. Commit changes
# 4. Create git tag: git tag v1.0.1
# 5. Publish: vsce publish
```

### Version Bumping

```bash
# Patch release (1.0.0 → 1.0.1)
vsce publish patch

# Minor release (1.0.0 → 1.1.0)
vsce publish minor

# Major release (1.0.0 → 2.0.0)
vsce publish major
```

## Marketplace Listing

After publishing, your extension will be available at:
- Marketplace: `https://marketplace.visualstudio.com/items?itemName=<publisher>.powershell-themes`
- VS Code: Search for "PowerShell Themes" in Extensions view

## Troubleshooting

### Common Issues

1. **Error: Missing publisher name**
   - Solution: Add publisher to package.json or use `vsce publish -p <publisher>`

2. **Error: Icon not found**
   - Solution: Ensure icon.png exists and is referenced in package.json

3. **Error: Invalid version**
   - Solution: Use semantic versioning (x.y.z) in package.json

4. **Error: Extension already exists**
   - Solution: Increment version number in package.json

## Support

For issues related to publishing:
- VS Code Publishing Guide: https://code.visualstudio.com/api/working-with-extensions/publishing-extension
- vsce Documentation: https://github.com/microsoft/vscode-vsce
- Azure DevOps: https://dev.azure.com/

## License

This extension is published under the MIT License.
