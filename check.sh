lastCommitedVersion="`git describe --match "v[0-9]*" --abbrev=4 HEAD`"
currentSoftwareVersion="v`cat build/linux/release/version`"

echo $lastCommitedVersion
echo $currentSoftwareVersion

if [ "$currentSoftwareVersion" != "$lastCommitedVersion" ]; then
    echo create a tag
    git tag -a "v`cat build/linux/release/version`"
    git push origin --tags
else
    echo tag already exists
    echo please check
fi
