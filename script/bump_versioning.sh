# branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
# echo $branch
cd ..
# YEAR MONTH
VERSION_NAME=1.0.0
month=$(date '+%Y%m')
count=$(git rev-list --all|wc -l|xargs)
code=$month$count
version=$VERSION_NAME+$code
sed -i -pe "s/\(.*version:.*\)/version: $version/g" pubspec.yaml