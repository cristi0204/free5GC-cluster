## FIRST STEP RUN ON HOST TO DOWNLOAD CLUSTE REPO
## MAKE SURE HOST IS CORRECT

export HOST=aos3





echo "Generating keypair for gitlab. Please manually add below public key to gitlab so we can pull cluste repo."
ssh-keygen -t rsa -C $HOST
echo
echo
cat ~/.ssh/id_rsa.pub 


echo "Press ANY KEY to continue."
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo ""
fi

git config --global user.email "peter@neux.io"
git config --global user.name "Peter Styk"

mkdir ~/git && cd ~/git && git clone git@gitlab.com:atosnet/cluster-5g.git
cd ~/git/cluster-5g