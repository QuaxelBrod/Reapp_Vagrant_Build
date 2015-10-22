#Build Environment to compile a reapp Application#

Found Reapp http://reapp.io/ and thinking of using this for some things.
Becaus I work in an Windows environment nothing fits together... So I decide to bring up 
a vagrant box to have a reproducable build environment.

---

### How to
Clone the project, go to the commandline and `vagrant up`
After provisioning is done you should have a build folder in the startapp folder.
Here is the output from reapp.

Now you can change you reapp project and go the long way (`vagrant provision`) or
just `vagrant ssh` and then type `/vagrant/buildapp.sh`
Output will go to startapp/build
Third type `cd /home/vagrant/builddir`. Now you can use `reapp build ...` as in 
http://reapp.io documented.

---

##License and Author

Project was created by QuaxelBrod

Licensed under MIT license

