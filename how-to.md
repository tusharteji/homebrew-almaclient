#HOW TO CREATE A PRIVATE HOMEBREW TAP

##Creating a Tarball for your tap

1. Create a new empty repository on GitHub
2. Clone the repository to your local workstation

'''git clone <url-of-the-remote-repo>'''

3. Write your script inside the cloned repository and make it executable using the following command:

'''chmod +x <script-name>'''

4. Commit changes locally and update the corresponding remote repository. While inside the local repository, run: 

'''
git add .
git commit -m "Write-commit-message-here"
git push -u origin master
'''

5. Creat a tarball and push it to remote repository using:

'''
git tag v1.0.0
git push origin v1.0.0
'''

*This process will create the tarball of your script and upload it under the **release** tab in your remote repository.*



##Creating the tap and installing it

1. Go to your remote repository and copy the link address of the tarball from the *release* tab
2. Go back to the terminal and run:

'''brew create <copied-link-address>'''

*This will create a ruby script and open it up for editing. Close the file for now.*

3. Create another blank repository on GitHub and name it with "homebrew-" as prefix. So, for example:

**homebrew-tools**

4. Clone this repository to your local workstation

'''git clone <url-of-the-remote-repo>'''

5. Move the ruby file created in step 2 inside this repository. So, first 'cd' into the repository and then run:

'''mv /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/script-name.rb .'''

*This will move the ruby tap file inside the repo. The source path in the above command may vary. So, find the ruby file and use its path.*
*Also note that the name of the ruby file with extension .rb, will be the same as the script name that you created in the first place.*

6. Now, open the file in any text editor and remove all the auto-generated comments. Also remove the **test** function and redefine the **install** function. Finally, your ruby tap script should look similar to this:

'''
class Almanac < Formula
  desc ""
  homepage ""
  url "https://github.com/tusharteji/almanac/archive/v1.0.1.tar.gz"
  sha256 "92f9be539542fdc30705e2b2ca5d4992c07b65b2a2586100a3e222ddcbe2adfa"

  def install
    bin.install "almanac"
  end

end
'''

*where in place of Almanac/almanac, you will see the name of your script.*

7. Commit your changes locally and update the corresponding remote repository (homebrew-tools)

While inside the local repo, run the following commands:
 
'''
git add .
git commit -m “Added Formula”
git push -u origin master
'''

8. "cd" into the root directory and run:

'''brew tap <git-username/git-repo-name-without-homebrew-prefix>'''

So, in the current example, if the github username is xyz, then run:

'''brew tap xyz/tools'''

9. Finally, install the tap using following command:

'''brew install <script-name>'''


**This process will install the tap and now you can run the script from anywhere using just the script-name.**
