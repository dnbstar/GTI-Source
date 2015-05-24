Copy and paste this entire folder to your Hard Drive's root directory. (That means put it in C:\)

Place the encrypt.bat file in the resource folder and use it to encrypt your client-side resources.

Drag and drop the client-side files over the encrypt.bat and update the meta.xml

Make sure wherever you put your resources on your local computer, the directory that you put it in doesn't have any spaces in between. For example:

C:\Users\Me\Documents\LuaResources - OK

C:\Users\Me\Documents\Lua Resources - NOT OK

C:\Users\FirstName\Documents\LuaResources - OK

C:\Users\FirstName LastName\Documents\LuaResources - NOT OK

Failure to do so will make the encrypt.bat file not work, and you'll have to transfer files back and forth between C:\Lua and your resource directory, and that's no fun.

Do not use old encryption methods as they will not work properly here.

Feel free to remove all .txt and .xml when you have done this (NOT FROM THE SERVER, FROM YOUR OWN FOLDER)