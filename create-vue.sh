
#To use this script:  sh  create-vue.sh  NewComponentName  ./new/component/path
#The component folder and files will be crated under [the provided path]/src/components/

echo "Creating component $1 in $2"

length=${#1}

first=$(echo "${1}" | awk '{ print substr( $0, 0, 1 ) }' | awk '{ print tolower($0); }' )

second=$(echo "${1}" | awk '{ print substr( $0, 2, '"${length}"' ) }')

className="${first}${second}"

cd $2/src/components

mkdir $1

cd $1

echo "<template>
  <div class="\"${className}\""></div>
</template>

<script>
import './${1}.scss';
export default {};
</script>" >> ${1}.vue

echo "."${className}" {
}" >> ${1}.scss


echo 'Finished!'
