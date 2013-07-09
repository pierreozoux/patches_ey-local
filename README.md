patches_ey-local
================

A set of patch for ey-local.

/!\ This is totally experimental, use it at your own risks /!\

/!\ To clean, uninstall and resintall the GEM /!\

Quick Start
===========

How to make ey-local working with MySQL and unicorn for instance :

Set up your env:
````
eylocal_version="1.0.2"

gem install engineyard-local -v $eylocal_version
git clone patches_ey-local
cd patches_ey-local

path_to_patches_eylocal=$(pwd)
path_to_eylocal=$(gem env | grep "INSTALLATION DIRECTORY" | cut -d":" -f2 | sed -e 's/^[ \t]*//')/gems/engineyard-local-$eylocal_version
````
Patch your installation:
````
cd $path_to_eylocal
patch -p1 < $path_to_patches_eylocal/patches/required.patch
patch -p1 < $path_to_patches_eylocal/patches/mysql.patch
patch -p1 < $path_to_patches_eylocal/patches/unicorn.patch
````

How to work on this project
===========================

You can now start Hacking :)

Setup the recipes
````
cd $path_to_eylocal
mkdir recipes.orig
cd recipes.orig
wget http://ey-cloud.s3.amazonaws.com/chef-ey-1.1.336.tgz
tar xvzf chef-ey-1.1.336.tgz
rm chef-ey-1.1.336.tgz
cd ..
cp -r recipes.orig recipes
````

And copy the fresh version in your local repo to share back patches
````
cd $path_to_patches_eylocal
cp -r $path_to_eylocal engineyard-local.orig
````

Change recipes (in the recipes folder) as you want
And share back :)

````
cd $path_to_eylocal
vi recipes/whatever_cookbook
bash patch_recipes.sh
don't forget to add my-chef-ey.patch to config/settings.yml
vi config/settings.yml
#add my-chef-ey.patch to config/settings.yml
````

change the dna! The libs, and then, create your own patch!
And share back :)

````
cd $path_to_patches_eylocal
./patch_ey.sh
mv patches/my.patch patches/the_patch_I_want_to_share.patch
````

Pull requests are more than welcome \o/

If you want to clean :
````
gem uninstall engineyard-local
gem install engineyard-local
````
