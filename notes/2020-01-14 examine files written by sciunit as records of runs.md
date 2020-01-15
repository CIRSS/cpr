## 2020-01-14 Examine files written by Sciunit as records of runs

### Determined types of files in sciunit trace directory

- Listed files in trace directory for sciunit-date sciunit created previously:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ ls -al  
	total 4460  
	drwxr-xr-x 3 tmcphill tmcphill 4096 Jan 13 19:02 .  
	drwxr-xr-x 3 tmcphill tmcphill 4096 Jan 13 18:41 ..  
	-rw-r--r-- 1 tmcphill tmcphill 6150 Jan 13 18:45 e1.json  
	-rw-r--r-- 1 tmcphill tmcphill 6193 Jan 13 18:51 e2.json  
	-rw-r--r-- 1 tmcphill tmcphill 8192 Jan 13 18:51 sciunit.db  
	drwxr-xr-x 2 tmcphill tmcphill 4096 Jan 13 19:02 scratch  
	-rw-r--r-- 1 tmcphill tmcphill 4499220 Jan 13 18:51 vvpkg.bin  
	-rw-r--r-- 1 tmcphill tmcphill 28672 Jan 13 18:51 vvpkg.db  
	-rw-r--r-- 1 tmcphill tmcphill 0 Jan 13 19:00 vvpkg.json
	```
- Used `file` command to probe type of each file:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ file *  
	e1.json: ASCII text, with very long lines, with no line terminators  
	e2.json: ASCII text, with very long lines, with no line terminators  
	sciunit.db: Berkeley DB (Btree, version 9, native byte-order)  
	scratch: directory  
	vvpkg.bin: POSIX tar archive (GNU)  
	vvpkg.db: SQLite 3.x database, last written using SQLite version 3021000  
	vvpkg.json: empty
	```
### Examined contents of the two JSON files in the trace directory

- The contents of the json file for the first execution, `e1.json` is:
	```json
	["7b3bfb1cef3f7b4ba76c755d0acb950d8fafe613","3c693d8603403991b97964d5ff606c6770689ca3","598b3154afcc227acd4b159adb4b9c10846e4d41","bc5a8ec4e542b2235ea8f96e467d928e190fba8b","4f7048dcb84c7df1a24afb28b5c6c5a26642ee31","ee56d9af4236e73e9afbe1fbaf2164d977bfaed9","3650867e84ed2575e91f2659befd21f397124542","24bdff2de9af73d9f05b05f962443197bc39eae2","cc4d4f5390ba08beeceda4cc5082b4837cbc81fd","86cf1e013310eb8f8a5dcd403969b3c3fec95c85","8d4c3226cae180433b581d7e5d6a3a1b74c6f07e","3d24f5af845dd052f2fd5526a8da3fa1b3159bf1","bb3081a79e9a75ca0d7fc44fcad26ec229b865cc","78b633a6b9df9c75e0c3728e00e0e18687f38588","b0b91e206158657df9da803f0c6b306198fc8a2c","37052b94a9137350a2d81c15f99194ce4ed86563","adc0b0fb83822214c400153a63e7c74d4c4ed991","086fc2e9a326decca674a7c6ed4e890748b60181","6fd2613644688f27123137a469ce3e98d55401b5","0aef67bf7506502453592923edb3e7b4705c67a0","3df2b68a0fc6d683136da68659716028004a9af6","df95478dd90a1df934afc6c18e63490073a94a42","0144d00bb0328db3cc41d7e9e539d60bd847c5fc","1fd7f49351e0d0f17efaaa691ec2a0d0fb667b38","b16be140466a243bd067406639cf2b4c4164c11d","e74031e29ed023123f7c7021396ad64722c8dd44","af21fb16212f2424d0bb0f3404fbce30a4552521","7cbcfddd1f31dbe17d331b1c5eca945a9802bdb5","6a10eeb8d4530820e5f3a10394bf4d35799c238e","bbf35130fcf34ed9c7f4e8648230c1b4fe67c7a9","ef9760700109d39aca0a1e569e5f35e8202fa567","23c485c180951f2b74ed004f77e329f29de7e766","c8534b670e839ac803d6605a3e16ccb9d7e11b1a","732c9d23613777b03f5abb047dfd536a874a2a95","c83c7a9894063c375a98efc626f3e91b028e6396","4fce6bc27199e3696ba36f47d520972cc156e02d","6e4fd345c23f1b0d6f2a83902df2c64fd966b561","9227268836c6e8bf08d5cc479f9e335988d61ff0","f603db424ee1b66c2e06df6859e18fb5755b754f","8dcf9ed547930216311e4a7aa88e392330fb5a06","da53d345d6b68ebe1602242034183834e49585d0","ab9a6be1d954a858977fd00106fc26b373308224","e07275c32e9b7032e00279c59f2808aecb681e70","7d1f4184e9eacb8d5e308587bb89e5a3053437a7","fa703d2f186112c19348c02cb3e98a04b6888faa","c88d77014695d399b18fdfc28925f45f4b584250","7b914a57aeb6b4492735d83c27aa3865b911e565","58a3f1f2276d6d2b2759ce4d69f1c1bedc93f0a3","388ba52160064646ae83e47e7bd4244ff33af291","419deef709b604d72408fa8952bea8c843795534","4f89cbb96cb2efc22660dddff46ed251b00d2ba2","98c801ecfb2f080c6d3c8d081d12e658654b69b2","a7729f874fa1b9517928fb1c16c9c809bbbbc453","fd91d3b30495bdbfd61607ecd190a63055ecce2e","36a00701f3ca3a94772ce18afe83a3b71d94ff81","3e85699ec0817aaad2bc919ad06bf2ac80cc3713","beab4bad3d4cd90bcd3ec165143e5091de27b912","060e53ecc0107540bb88aeef4b21fffe44b10e71","e37db1afac0ec6a91fe272f55ffa17d6a32318e9","b42aaddcc3df92c4d2c4b906baa91f006abf0802","5ebc6f40c99c2909493bc0ffe9402b400ce1db9e","5b619ccc070bf9fab4b4a0e23b39d1b61a32c4ec","0a5665ceaebeb12cc209d5fa1a5d14699e76dfa6","73c0bfa36e1dec3ced99145343507ccf2093c5e0","01ce548e4fc571fda40097270d77f7875caf0302","98cb91cd1cd923f68bbf2abdd1bb1498a9834348","18e39c5f6ff8a766ef36aa26ddda63e688bc05bb","98cb7e6d4e5bb8c412b71ebe4c87bfaf76638731","65ad6737845dca0e4d74ab523eaea747b58276d8","e5aaaabc04f21ddd62ad3c4be17fd98614646905","f1f9da295308efed7b254c7b983456f3636a1e60","f6d5f7ee78e782e69482282c3260da0e35967c2b","d78bd46fbf129e57cb7084ee268f321975c62635","35872579a35525d495e690733b145e94f0e06147","5732aa30b8ad5f8a6d80ac6d7d9d33e03503b384","536642fe224ebe38daee3c1b422d9a86bb6b9460","6790ca5d7892ed2cdfa7be6b52552339454b8523","12d57cd462cfe2fd42d177937dc58a6dcbeb11f3","94fbf66abb624bcfe740293ceab38213b4af3034","b5a0c1826457a22f58aab019325a1bc274576109","bbf6c3943260307aa2687ceb610b7a85ae8babbf","df72c04c25c930d0af684bb65b45bc580e415c25","149578ffcee2f78f5fc4dcbd8ed8945d1ebfce2d","44f084b3f41a47751165c65af1015a52bff59e43","8daf7867d76c57d8e1b1bcddfe1fd8198f2de2c8","5b9c1ab93b84856208cf8f9e6d11ae75e1b8e39e","1f05c10bb0443347aeb79115e5f1843a33ef3da9","a30457d6c35b4e43e98e5808a5cf54b38bea7227","823f4f5656b56b0fa97d2d572bd013fded517766","4d3115cdb30be64e13cede661416afb0ecbd88d1","c05156a8658ebeec8e451513d4fc1307de7ac289","f454da6c26b20703f5e91352a51816eba2a9f3ce","3aad2852c3d9fb77a84d745e87d8fff311c0ef2d","0c0f815f046d648678994bbe1e53ddbad9edf9f2","b1be6d101c636c9d985db84b9d579a02238810cb","42cdb14c254ca66c16140b2ec03a0b7798e4ebc2","a8148aac1e6ca4993284c691bc80a4cb091f1026","903ac672f16bc4b5a53b79de689eb694fbd600be","6cc09d3340b7df8a2183790a2c6f98270ac2d830","b2a0c4ae4f9a645046b6f760ee145a7dc437d6e1","23980bb5d8b81cdea83ba854850a8d9e33c8a8da","6065f59452bbb404fec9ee0606c84311703be3cf","a942d58c8149c467723799a05ba6d3723f4f66fd","90f5cfe0d0a35c46a1a99f47c4648cabc9b7ef86","f43524d1b1fe033ae5843a2b95abfb94e42db1a0","7ff77067e984d08e4db132f3a283969ab9664e85","fd273e9dca7350764a6f61bd2d605365bc92ddce","8b3f9891cb2ee15a3cebf09c3aab89aa08722056","f695ec73734f101ebbcd3d257dc9c8240e696b15","44b1f85999568aef9f2d0f97dbbafc066cedf130","56b873dfd01425c34a51d19fa48c54264ff3dbed","67854e3cc00de823722e38634254440d3efc80bb","d9e254dcbed01e8bae982813512a101a8f1db60b","4bca8af86580228ddf69f9ae5059e25abf91ca15","bce1b7045e98585e126c08c83bff075248fb5ae6","eed442757bc7fb55883726f8813adfe606a91989","f442bd868bc2644c5edeefffb0be58e49f81a8be","3e3034a81e15d734045698b53faf458e3f6373f9","914cfc43461828f55420d9a9236ce80341c408d4","bf2cfef6a0c76fc97009dbb18a9aef2dcaae5465","69cb2a11970301b8de3199b756ee825adcdb8d84","5473fe2845412d86510b522678e5c0bdddbfb9a5","abcb948ee744740e223b4b5f5ebefc90f914abd9","738d92c7e5f114de14cb07ce1f2473c334038fdc","7b65f93551fa70d70b03b85d08ee629cd0713a6f","3e57bea4d04979d2d1cc75ba8728e5e15a6a895a","314b1d6b600d00b5817a75f9c8ffeae1d79087fd","4707d36b35554babaf063723db13a9ee7d181707","b142fd4716db209c2381c3c382428c3db3f1bf70","f9e0f7a2143014f5cbe41b08c794126f606fe1f4","8ace8550eea1ce1affcb7596551e4cd7aab07799","7f4f8148421cb79c6f1784aae869fce0034be872","098fa72d7edaec688419f5bdca0d183618f08f7b","66c813df2b5ef0f8898086f1e95f688c902aacdc","7f471534429166138f64b55aec26ae4f3835f381","5681b0a4887de7a43faf654ef4b5561596c9de13","e3fa5c6b973aa574ea1798e05c7b6360fa122b19","5f39bc4d0cb8cde7d167466f933f52f89908a88f","db8d38e6cfa69e836f4f6e4d7f005a69ace0d830","00a0fa54dafc9a9bb3277082f79d5e2fa98316b3","d7d6588e159abc955a4955f81de7fe5f1cbd9930","3c0c71196418366cc649b62e9457f638368c0162","04103ba008dcedf29c66579d9716de032b838a70"]
	```
- Similarly, the contents of `e2.json` are:
	```json
	["7349fed1de4127bda93401ee7045813ecfe6a1a4","3c693d8603403991b97964d5ff606c6770689ca3","598b3154afcc227acd4b159adb4b9c10846e4d41","bc5a8ec4e542b2235ea8f96e467d928e190fba8b","4f7048dcb84c7df1a24afb28b5c6c5a26642ee31","ee56d9af4236e73e9afbe1fbaf2164d977bfaed9","3650867e84ed2575e91f2659befd21f397124542","24bdff2de9af73d9f05b05f962443197bc39eae2","cc4d4f5390ba08beeceda4cc5082b4837cbc81fd","86cf1e013310eb8f8a5dcd403969b3c3fec95c85","8d4c3226cae180433b581d7e5d6a3a1b74c6f07e","3d24f5af845dd052f2fd5526a8da3fa1b3159bf1","bb3081a79e9a75ca0d7fc44fcad26ec229b865cc","78b633a6b9df9c75e0c3728e00e0e18687f38588","b0b91e206158657df9da803f0c6b306198fc8a2c","37052b94a9137350a2d81c15f99194ce4ed86563","adc0b0fb83822214c400153a63e7c74d4c4ed991","086fc2e9a326decca674a7c6ed4e890748b60181","22c32eb65025c0b6d3d34fa8b633a56f2da35d32","0aef67bf7506502453592923edb3e7b4705c67a0","50ec7e55081d25e1911218ce3a312ab61f7abf38","df95478dd90a1df934afc6c18e63490073a94a42","0144d00bb0328db3cc41d7e9e539d60bd847c5fc","1fd7f49351e0d0f17efaaa691ec2a0d0fb667b38","b16be140466a243bd067406639cf2b4c4164c11d","e74031e29ed023123f7c7021396ad64722c8dd44","af21fb16212f2424d0bb0f3404fbce30a4552521","7cbcfddd1f31dbe17d331b1c5eca945a9802bdb5","6a10eeb8d4530820e5f3a10394bf4d35799c238e","bbf35130fcf34ed9c7f4e8648230c1b4fe67c7a9","ef9760700109d39aca0a1e569e5f35e8202fa567","23c485c180951f2b74ed004f77e329f29de7e766","c8534b670e839ac803d6605a3e16ccb9d7e11b1a","732c9d23613777b03f5abb047dfd536a874a2a95","c83c7a9894063c375a98efc626f3e91b028e6396","4fce6bc27199e3696ba36f47d520972cc156e02d","6e4fd345c23f1b0d6f2a83902df2c64fd966b561","9227268836c6e8bf08d5cc479f9e335988d61ff0","f603db424ee1b66c2e06df6859e18fb5755b754f","8dcf9ed547930216311e4a7aa88e392330fb5a06","da53d345d6b68ebe1602242034183834e49585d0","ab9a6be1d954a858977fd00106fc26b373308224","e07275c32e9b7032e00279c59f2808aecb681e70","7d1f4184e9eacb8d5e308587bb89e5a3053437a7","fa703d2f186112c19348c02cb3e98a04b6888faa","c88d77014695d399b18fdfc28925f45f4b584250","7b914a57aeb6b4492735d83c27aa3865b911e565","58a3f1f2276d6d2b2759ce4d69f1c1bedc93f0a3","388ba52160064646ae83e47e7bd4244ff33af291","419deef709b604d72408fa8952bea8c843795534","4f89cbb96cb2efc22660dddff46ed251b00d2ba2","98c801ecfb2f080c6d3c8d081d12e658654b69b2","a7729f874fa1b9517928fb1c16c9c809bbbbc453","fd91d3b30495bdbfd61607ecd190a63055ecce2e","36a00701f3ca3a94772ce18afe83a3b71d94ff81","3e85699ec0817aaad2bc919ad06bf2ac80cc3713","beab4bad3d4cd90bcd3ec165143e5091de27b912","060e53ecc0107540bb88aeef4b21fffe44b10e71","e37db1afac0ec6a91fe272f55ffa17d6a32318e9","b42aaddcc3df92c4d2c4b906baa91f006abf0802","5ebc6f40c99c2909493bc0ffe9402b400ce1db9e","5b619ccc070bf9fab4b4a0e23b39d1b61a32c4ec","0a5665ceaebeb12cc209d5fa1a5d14699e76dfa6","73c0bfa36e1dec3ced99145343507ccf2093c5e0","01ce548e4fc571fda40097270d77f7875caf0302","98cb91cd1cd923f68bbf2abdd1bb1498a9834348","18e39c5f6ff8a766ef36aa26ddda63e688bc05bb","98cb7e6d4e5bb8c412b71ebe4c87bfaf76638731","65ad6737845dca0e4d74ab523eaea747b58276d8","e5aaaabc04f21ddd62ad3c4be17fd98614646905","f1f9da295308efed7b254c7b983456f3636a1e60","f6d5f7ee78e782e69482282c3260da0e35967c2b","d78bd46fbf129e57cb7084ee268f321975c62635","35872579a35525d495e690733b145e94f0e06147","5732aa30b8ad5f8a6d80ac6d7d9d33e03503b384","536642fe224ebe38daee3c1b422d9a86bb6b9460","6790ca5d7892ed2cdfa7be6b52552339454b8523","12d57cd462cfe2fd42d177937dc58a6dcbeb11f3","94fbf66abb624bcfe740293ceab38213b4af3034","b5a0c1826457a22f58aab019325a1bc274576109","bbf6c3943260307aa2687ceb610b7a85ae8babbf","df72c04c25c930d0af684bb65b45bc580e415c25","149578ffcee2f78f5fc4dcbd8ed8945d1ebfce2d","44f084b3f41a47751165c65af1015a52bff59e43","8daf7867d76c57d8e1b1bcddfe1fd8198f2de2c8","5b9c1ab93b84856208cf8f9e6d11ae75e1b8e39e","1f05c10bb0443347aeb79115e5f1843a33ef3da9","a30457d6c35b4e43e98e5808a5cf54b38bea7227","823f4f5656b56b0fa97d2d572bd013fded517766","4d3115cdb30be64e13cede661416afb0ecbd88d1","e48e2896afdac24fdeaffa263fb1da1cb51b46c2","9a79ffa6e36593a9501c5ffad57004f01912d6f4","6df800f23eee63b006b84ad4ad0db5dd4b5b5dda","3aad2852c3d9fb77a84d745e87d8fff311c0ef2d","0c0f815f046d648678994bbe1e53ddbad9edf9f2","b1be6d101c636c9d985db84b9d579a02238810cb","42cdb14c254ca66c16140b2ec03a0b7798e4ebc2","a8148aac1e6ca4993284c691bc80a4cb091f1026","903ac672f16bc4b5a53b79de689eb694fbd600be","6cc09d3340b7df8a2183790a2c6f98270ac2d830","b2a0c4ae4f9a645046b6f760ee145a7dc437d6e1","23980bb5d8b81cdea83ba854850a8d9e33c8a8da","6065f59452bbb404fec9ee0606c84311703be3cf","a942d58c8149c467723799a05ba6d3723f4f66fd","90f5cfe0d0a35c46a1a99f47c4648cabc9b7ef86","f43524d1b1fe033ae5843a2b95abfb94e42db1a0","7ff77067e984d08e4db132f3a283969ab9664e85","fd273e9dca7350764a6f61bd2d605365bc92ddce","8b3f9891cb2ee15a3cebf09c3aab89aa08722056","f695ec73734f101ebbcd3d257dc9c8240e696b15","44b1f85999568aef9f2d0f97dbbafc066cedf130","56b873dfd01425c34a51d19fa48c54264ff3dbed","67854e3cc00de823722e38634254440d3efc80bb","d9e254dcbed01e8bae982813512a101a8f1db60b","4bca8af86580228ddf69f9ae5059e25abf91ca15","bce1b7045e98585e126c08c83bff075248fb5ae6","eed442757bc7fb55883726f8813adfe606a91989","f442bd868bc2644c5edeefffb0be58e49f81a8be","3e3034a81e15d734045698b53faf458e3f6373f9","914cfc43461828f55420d9a9236ce80341c408d4","bf2cfef6a0c76fc97009dbb18a9aef2dcaae5465","69cb2a11970301b8de3199b756ee825adcdb8d84","5473fe2845412d86510b522678e5c0bdddbfb9a5","abcb948ee744740e223b4b5f5ebefc90f914abd9","738d92c7e5f114de14cb07ce1f2473c334038fdc","7b65f93551fa70d70b03b85d08ee629cd0713a6f","3e57bea4d04979d2d1cc75ba8728e5e15a6a895a","314b1d6b600d00b5817a75f9c8ffeae1d79087fd","4707d36b35554babaf063723db13a9ee7d181707","b142fd4716db209c2381c3c382428c3db3f1bf70","f9e0f7a2143014f5cbe41b08c794126f606fe1f4","8ace8550eea1ce1affcb7596551e4cd7aab07799","7f4f8148421cb79c6f1784aae869fce0034be872","098fa72d7edaec688419f5bdca0d183618f08f7b","66c813df2b5ef0f8898086f1e95f688c902aacdc","7f471534429166138f64b55aec26ae4f3835f381","5681b0a4887de7a43faf654ef4b5561596c9de13","e3fa5c6b973aa574ea1798e05c7b6360fa122b19","5f39bc4d0cb8cde7d167466f933f52f89908a88f","92261238adb4ff8349e0e99ee41201b8f9a209e3","00a0fa54dafc9a9bb3277082f79d5e2fa98316b3","d7d6588e159abc955a4955f81de7fe5f1cbd9930","3c0c71196418366cc649b62e9457f638368c0162","04103ba008dcedf29c66579d9716de032b838a70"]
	```
### Examined contents of the Berkeley DB file in the trace directory

- Installed `db-util` package for working with Berkeley DB files:
	```
	tmcphill@circe:~/sciunit/sciunit-date$ sudo apt install db-util
	Reading package lists... Done
	Building dependency tree
	Reading state information... Done
	The following packages were automatically installed and are no longer required:
	  dirmngr python-apt-common
	Use 'sudo apt autoremove' to remove them.
	The following additional packages will be installed:
	  db5.3-util
	The following NEW packages will be installed:
	  db-util db5.3-util
	0 upgraded, 2 newly installed, 0 to remove and 52 not upgraded.
	Need to get 67.6 kB of archives.
	After this operation, 296 kB of additional disk space will be used.
	Do you want to continue? [Y/n]
	Get:1 http://deb.debian.org/debian stretch/main amd64 db5.3-util amd64 5.3.28-12+deb9u1 [64.8
	Get:2 http://deb.debian.org/debian stretch/main amd64 db-util all 5.3.1 [2,782 B]
	Fetched 67.6 kB in 0s (227 kB/s)
	Selecting previously unselected package db5.3-util.
	(Reading database ... 46714 files and directories currently installed.)
	Preparing to unpack .../db5.3-util_5.3.28-12+deb9u1_amd64.deb ...
	Unpacking db5.3-util (5.3.28-12+deb9u1) ...
	Selecting previously unselected package db-util.
	Preparing to unpack .../archives/db-util_5.3.1_all.deb ...
	Unpacking db-util (5.3.1) ...
	Setting up db5.3-util (5.3.28-12+deb9u1) ...
	Processing triggers for man-db (2.7.6.1-2) ...
	Setting up db-util (5.3.1) ...
	```
- Confirmed that `sciunit.db` contains only a single database:
	```
	tmcphill@circe:~/sciunit/sciunit-date$ db_dump -l sciunit.db
	db_dump: BDB5116 sciunit.db: does not contain multiple databases
	```
- Dumped contents of the database:
	```
	tmcphill@circe:~/sciunit/sciunit-date$ db_dump -da sciunit.db
	In-memory DB structure:
	recno: 0x110000 (open called, read-only)
	bt_meta: 0 bt_root: 1
	bt_minkey: 2
	bt_compare: 0x7f9520ea92c0 bt_prefix: 0x7f9520ea94a0
	bt_compress: 0 bt_decompress: 0
	bt_lpgno: 0
	re_pad: 0x20 re_delim: 0xa re_len: 0 re_source:
	re_modified: 0 re_eof: 1 re_last: 0
	=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	page 0: btree metadata: LSN [0][1]: level 0
	        magic: 0x53162
	        version: 9
	        pagesize: 4096
	        type: 9
	        metaflags 0
	        keys: 2 records: 2
	        free list: 0
	        last_pgno: 1
	        flags: 0x2 (recno)
	        uid: bf 23 2 0 10 8 0 0 bf 47 80 30 10 3e 0 0 0 0 0 0
	        minkey: 2
	        re_len: 0 re_pad: 0x20
	        root: 1
	page 1: recno leaf: LSN [0][1]: level 1 records: 2
	        prev:    0 next:    0 entries:    2 offset: 3944
	        [000] 4020 len:  71 data: {"started":"2020-01-14T02:45:57.075345Z","cmd":["date"],"size":4239360}
	        [001] 3944 len:  71 data: {"started":"2020-01-14T02:51:52.408078Z","cmd":["date"],"size":4239360}
	```
- The database appears to contain two records with values representing the timestamp and command associated with each recorded run:
	```json
	{
	"started":"2020-01-14T02:45:57.075345Z",
	"cmd":["date"],
	"size":4239360
	}
	```

	```json
	{
	"started":"2020-01-14T02:51:52.408078Z",
	"cmd":["date"],
	"size":4239360
	}
	```
- The values of the `size` properties in each record above are similar in magnitude to the size in bytes of the `vvpkg.bin` tar file in the trace directory:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ ls -al vvpkg.bin  
	-rw-r--r-- 1 tmcphill tmcphill 4499220 Jan 13 18:51 vvpkg.bin
	```

### Examined contents of the Sqlite3 file in the trace directory

- Opened the `vvpkg.db` file using the `sqlite3` tool:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ sqlite3 vvpkg.db
	SQLite version 3.16.2 2017-01-06 16:32:41
	Enter ".help" for usage hints.
	```
- Determined that the database contains a single table `cblocks`:
	```
	sqlite> .tables
	cblocks
	
	sqlite> .schema cblocks
	CREATE TABLE cblocks (
	                     id     blob primary key,
	                     offset integer not null,
	                     size   integer not null
	                     ) without rowid;
	CREATE UNIQUE INDEX size_idx
	                    on cblocks(offset)
	                    ;
	```
- Dumped the entire `cblocks` table:
	```
	sqlite> .dump cblocks
	PRAGMA foreign_keys=OFF;
	BEGIN TRANSACTION;
	CREATE TABLE cblocks (
	                            id     blob primary key,
	                            offset integer not null,
	                            size   integer not null
	                        ) without rowid;
	INSERT INTO "cblocks" VALUES(X'00A0FA54DAFC9A9BB3277082F79D5E2FA98316B3',4144691,26907);
	INSERT INTO "cblocks" VALUES(X'0144D00BB0328DB3CC41D7E9E539D60BD847C5FC',620230,16939);
	INSERT INTO "cblocks" VALUES(X'01CE548E4FC571FDA40097270D77F7875CAF0302',1833537,30887);
	INSERT INTO "cblocks" VALUES(X'04103BA008DCEDF29C66579D9716DE032B838A70',4225141,14219);
	INSERT INTO "cblocks" VALUES(X'060E53ECC0107540BB88AEEF4B21FFFE44B10E71',1591145,27955);
	INSERT INTO "cblocks" VALUES(X'086FC2E9A326DECCA674A7C6ED4E890748B60181',503658,23429);
	INSERT INTO "cblocks" VALUES(X'098FA72D7EDAEC688419F5BDCA0D183618F08F7B',3892435,81280);
	INSERT INTO "cblocks" VALUES(X'0A5665CEAEBEB12CC209D5FA1A5D14699E76DFA6',1745831,53569);
	INSERT INTO "cblocks" VALUES(X'0AEF67BF7506502453592923EDB3E7B4705C67A0',560674,15136);
	INSERT INTO "cblocks" VALUES(X'0C0F815F046D648678994BBE1E53DDBAD9EDF9F2',2602894,45101);
	INSERT INTO "cblocks" VALUES(X'12D57CD462CFE2FD42D177937DC58A6DCBEB11F3',2138152,44308);
	INSERT INTO "cblocks" VALUES(X'149578FFCEE2F78F5FC4DCBD8ED8945D1EBFCE2D',2260976,17003);
	INSERT INTO "cblocks" VALUES(X'18E39C5F6FF8A766EF36AA26DDDA63E688BC05BB',1889463,15301);
	INSERT INTO "cblocks" VALUES(X'1F05C10BB0443347AEB79115E5F1843A33EF3DA9',2335065,33762);
	INSERT INTO "cblocks" VALUES(X'1FD7F49351E0D0F17EFAAA691EC2A0D0FB667B38',637169,20101);
	INSERT INTO "cblocks" VALUES(X'22C32EB65025C0B6D3D34FA8B633A56F2DA35D32',4254442,33587);
	INSERT INTO "cblocks" VALUES(X'23980BB5D8B81CDEA83BA854850A8D9E33C8A8DA',2830134,43064);
	INSERT INTO "cblocks" VALUES(X'23C485C180951F2B74ED004F77E329F29DE7E766',873057,47520);
	INSERT INTO "cblocks" VALUES(X'24BDFF2DE9AF73D9F05B05F962443197BC39EAE2',191865,12374);
	INSERT INTO "cblocks" VALUES(X'314B1D6B600D00B5817A75F9C8FFEAE1D79087FD',3696639,45491);
	INSERT INTO "cblocks" VALUES(X'35872579A35525D495E690733B145E94F0E06147',2063992,13315);
	INSERT INTO "cblocks" VALUES(X'3650867E84ED2575E91F2659BEFD21F397124542',153024,38841);
	INSERT INTO "cblocks" VALUES(X'36A00701F3CA3A94772CE18AFE83A3B71D94FF81',1497401,38646);
	INSERT INTO "cblocks" VALUES(X'37052B94A9137350A2D81C15F99194CE4ED86563',421605,66521);
	INSERT INTO "cblocks" VALUES(X'388BA52160064646AE83E47E7BD4244FF33AF291',1359036,22625);
	INSERT INTO "cblocks" VALUES(X'3AAD2852C3D9FB77A84D745E87D8FFF311C0EF2D',2580792,22102);
	INSERT INTO "cblocks" VALUES(X'3C0C71196418366CC649B62E9457F638368C0162',4196713,28428);
	INSERT INTO "cblocks" VALUES(X'3C693D8603403991B97964D5FF606C6770689CA3',15082,25052);
	INSERT INTO "cblocks" VALUES(X'3D24F5AF845DD052F2FD5526A8DA3FA1B3159BF1',291479,41520);
	INSERT INTO "cblocks" VALUES(X'3DF2B68A0FC6D683136DA68659716028004A9AF6',575810,30093);
	INSERT INTO "cblocks" VALUES(X'3E3034A81E15D734045698B53FAF458E3F6373F9',3430826,13260);
	INSERT INTO "cblocks" VALUES(X'3E57BEA4D04979D2D1CC75BA8728E5E15A6A895A',3646502,50137);
	INSERT INTO "cblocks" VALUES(X'3E85699EC0817AAAD2BC919AD06BF2AC80CC3713',1536047,31387);
	INSERT INTO "cblocks" VALUES(X'419DEEF709B604D72408FA8952BEA8C843795534',1381661,12766);
	INSERT INTO "cblocks" VALUES(X'42CDB14C254CA66C16140B2EC03A0B7798E4EBC2',2676725,22617);
	INSERT INTO "cblocks" VALUES(X'44B1F85999568AEF9F2D0F97DBBAFC066CEDF130',3180283,21988);
	INSERT INTO "cblocks" VALUES(X'44F084B3F41A47751165C65AF1015A52BFF59E43',2277979,19005);
	INSERT INTO "cblocks" VALUES(X'4707D36B35554BABAF063723DB13A9EE7D181707',3742130,51081);
	INSERT INTO "cblocks" VALUES(X'4BCA8AF86580228DDF69F9AE5059E25ABF91CA15',3311262,12354);
	INSERT INTO "cblocks" VALUES(X'4D3115CDB30BE64E13CEDE661416AFB0ECBD88D1',2405655,21488);
	INSERT INTO "cblocks" VALUES(X'4F7048DCB84C7DF1A24AFB28B5C6C5A26642EE31',93758,41503);
	INSERT INTO "cblocks" VALUES(X'4F89CBB96CB2EFC22660DDDFF46ED251B00D2BA2',1394427,38804);
	INSERT INTO "cblocks" VALUES(X'4FCE6BC27199E3696BA36F47D520972CC156E02D',990564,33620);
	INSERT INTO "cblocks" VALUES(X'50EC7E55081D25E1911218CE3A312AB61F7ABF38',4288029,30093);
	INSERT INTO "cblocks" VALUES(X'536642FE224EBE38DAEE3C1B422D9A86BB6B9460',2090266,23552);
	INSERT INTO "cblocks" VALUES(X'5473FE2845412D86510B522678E5C0BDDDBFB9A5',3524916,15766);
	INSERT INTO "cblocks" VALUES(X'5681B0A4887DE7A43FAF654EF4B5561596C9DE13',4044543,40721);
	INSERT INTO "cblocks" VALUES(X'56B873DFD01425C34A51D19FA48C54264FF3DBED',3202271,17533);
	INSERT INTO "cblocks" VALUES(X'5732AA30B8AD5F8A6D80AC6D7D9D33E03503B384',2077307,12959);
	INSERT INTO "cblocks" VALUES(X'58A3F1F2276D6D2B2759CE4D69F1C1BEDC93F0A3',1344779,14257);
	INSERT INTO "cblocks" VALUES(X'598B3154AFCC227ACD4B159ADB4B9C10846E4D41',40134,21239);
	INSERT INTO "cblocks" VALUES(X'5B619CCC070BF9FAB4B4A0E23B39D1B61A32C4EC',1697093,48738);
	INSERT INTO "cblocks" VALUES(X'5B9C1AB93B84856208CF8F9E6D11AE75E1B8E39E',2311823,23242);
	INSERT INTO "cblocks" VALUES(X'5EBC6F40C99C2909493BC0FFE9402B400CE1DB9E',1676657,20436);
	INSERT INTO "cblocks" VALUES(X'5F39BC4D0CB8CDE7D167466F933F52F89908A88F',4101217,16025);
	INSERT INTO "cblocks" VALUES(X'6065F59452BBB404FEC9EE0606C84311703BE3CF',2873198,39992);
	INSERT INTO "cblocks" VALUES(X'65AD6737845DCA0E4D74AB523EAEA747B58276D8',1924578,39721);
	INSERT INTO "cblocks" VALUES(X'66C813DF2B5EF0F8898086F1E95F688C902AACDC',3973715,12716);
	INSERT INTO "cblocks" VALUES(X'67854E3CC00DE823722E38634254440D3EFC80BB',3219804,76946);
	INSERT INTO "cblocks" VALUES(X'6790CA5D7892ED2CDFA7BE6B52552339454B8523',2113818,24334);
	INSERT INTO "cblocks" VALUES(X'69CB2A11970301B8DE3199B756EE825ADCDB8D84',3484925,39991);
	INSERT INTO "cblocks" VALUES(X'6A10EEB8D4530820E5F3A10394BF4D35799C238E',759755,38709);
	INSERT INTO "cblocks" VALUES(X'6CC09D3340B7DF8A2183790A2C6F98270AC2D830',2729253,19577);
	INSERT INTO "cblocks" VALUES(X'6DF800F23EEE63B006B84AD4AD0DB5DD4B5B5DDA',4430672,41099);
	INSERT INTO "cblocks" VALUES(X'6E4FD345C23F1B0D6F2A83902DF2C64FD966B561',1024184,16457);
	INSERT INTO "cblocks" VALUES(X'6FD2613644688F27123137A469CE3E98D55401B5',527087,33587);
	INSERT INTO "cblocks" VALUES(X'732C9D23613777B03F5ABB047DFD536A874A2A95',941958,32715);
	INSERT INTO "cblocks" VALUES(X'7349FED1DE4127BDA93401EE7045813ECFE6A1A4',4239360,15082);
	INSERT INTO "cblocks" VALUES(X'738D92C7E5F114DE14CB07CE1F2473C334038FDC',3585342,29251);
	INSERT INTO "cblocks" VALUES(X'73C0BFA36E1DEC3CED99145343507CCF2093C5E0',1799400,34137);
	INSERT INTO "cblocks" VALUES(X'78B633A6B9DF9C75E0C3728E00E0E18687F38588',363644,43626);
	INSERT INTO "cblocks" VALUES(X'7B3BFB1CEF3F7B4BA76C755D0ACB950D8FAFE613',0,15082);
	INSERT INTO "cblocks" VALUES(X'7B65F93551FA70D70B03B85D08EE629CD0713A6F',3614593,31909);
	INSERT INTO "cblocks" VALUES(X'7B914A57AEB6B4492735D83C27AA3865B911E565',1290693,54086);
	INSERT INTO "cblocks" VALUES(X'7CBCFDDD1F31DBE17D331B1C5ECA945A9802BDB5',732718,27037);
	INSERT INTO "cblocks" VALUES(X'7D1F4184E9EACB8D5E308587BB89E5A3053437A7',1229144,23355);
	INSERT INTO "cblocks" VALUES(X'7F471534429166138F64B55AEC26AE4F3835F381',3986431,58112);
	INSERT INTO "cblocks" VALUES(X'7F4F8148421CB79C6F1784AAE869FCE0034BE872',3858786,33649);
	INSERT INTO "cblocks" VALUES(X'7FF77067E984D08E4DB132F3A283969AB9664E85',2981893,37794);
	INSERT INTO "cblocks" VALUES(X'823F4F5656B56B0FA97D2D572BD013FDED517766',2383335,22320);
	INSERT INTO "cblocks" VALUES(X'86CF1E013310EB8F8A5DCD403969B3C3FEC95C85',219926,44569);
	INSERT INTO "cblocks" VALUES(X'8ACE8550EEA1CE1AFFCB7596551E4CD7AAB07799',3844390,14396);
	INSERT INTO "cblocks" VALUES(X'8B3F9891CB2EE15A3CEBF09C3AAB89AA08722056',3112684,19667);
	INSERT INTO "cblocks" VALUES(X'8D4C3226CAE180433B581D7E5D6A3A1B74C6F07E',264495,26984);
	INSERT INTO "cblocks" VALUES(X'8DAF7867D76C57D8E1B1BCDDFE1FD8198F2DE2C8',2296984,14839);
	INSERT INTO "cblocks" VALUES(X'8DCF9ED547930216311E4A7AA88E392330FB5A06',1117613,40824);
	INSERT INTO "cblocks" VALUES(X'903AC672F16BC4B5A53B79DE689EB694FBD600BE',2714509,14744);
	INSERT INTO "cblocks" VALUES(X'90F5CFE0D0A35C46A1A99F47C4648CABC9B7EF86',2931391,34194);
	INSERT INTO "cblocks" VALUES(X'914CFC43461828F55420D9A9236CE80341C408D4',3444086,21338);
	INSERT INTO "cblocks" VALUES(X'92261238ADB4FF8349E0E99EE41201B8F9A209E3',4471771,27449);
	INSERT INTO "cblocks" VALUES(X'9227268836C6E8BF08D5CC479F9E335988D61FF0',1040641,25161);
	INSERT INTO "cblocks" VALUES(X'94FBF66ABB624BCFE740293CEAB38213B4AF3034',2182460,13415);
	INSERT INTO "cblocks" VALUES(X'98C801ECFB2F080C6D3C8D081D12E658654B69B2',1433231,25392);
	INSERT INTO "cblocks" VALUES(X'98CB7E6D4E5BB8C412B71EBE4C87BFAF76638731',1904764,19814);
	INSERT INTO "cblocks" VALUES(X'98CB91CD1CD923F68BBF2ABDD1BB1498A9834348',1864424,25039);
	INSERT INTO "cblocks" VALUES(X'9A79FFA6E36593A9501C5FFAD57004F01912D6F4',4332368,98304);
	INSERT INTO "cblocks" VALUES(X'A30457D6C35B4E43E98E5808A5CF54B38BEA7227',2368827,14508);
	INSERT INTO "cblocks" VALUES(X'A7729F874FA1B9517928FB1C16C9C809BBBBC453',1458623,26469);
	INSERT INTO "cblocks" VALUES(X'A8148AAC1E6CA4993284C691BC80A4CB091F1026',2699342,15167);
	INSERT INTO "cblocks" VALUES(X'A942D58C8149C467723799A05BA6D3723F4F66FD',2913190,18201);
	INSERT INTO "cblocks" VALUES(X'AB9A6BE1D954A858977FD00106FC26B373308224',1174640,12903);
	INSERT INTO "cblocks" VALUES(X'ABCB948EE744740E223B4B5F5EBEFC90F914ABD9',3540682,44660);
	INSERT INTO "cblocks" VALUES(X'ADC0B0FB83822214C400153A63E7C74D4C4ED991',488126,15532);
	INSERT INTO "cblocks" VALUES(X'AF21FB16212F2424D0BB0F3404FBCE30A4552521',719508,13210);
	INSERT INTO "cblocks" VALUES(X'B0B91E206158657DF9DA803F0C6B306198FC8A2C',407270,14335);
	INSERT INTO "cblocks" VALUES(X'B142FD4716DB209C2381C3C382428C3DB3F1BF70',3793211,32723);
	INSERT INTO "cblocks" VALUES(X'B16BE140466A243BD067406639CF2B4C4164C11D',657270,34386);
	INSERT INTO "cblocks" VALUES(X'B1BE6D101C636C9D985DB84B9D579A02238810CB',2647995,28730);
	INSERT INTO "cblocks" VALUES(X'B2A0C4AE4F9A645046B6F760EE145A7DC437D6E1',2748830,81304);
	INSERT INTO "cblocks" VALUES(X'B42AADDCC3DF92C4D2C4B906BAA91F006ABF0802',1645235,31422);
	INSERT INTO "cblocks" VALUES(X'B5A0C1826457A22F58AAB019325A1BC274576109',2195875,29797);
	INSERT INTO "cblocks" VALUES(X'BB3081A79E9A75CA0D7FC44FCAD26EC229B865CC',332999,30645);
	INSERT INTO "cblocks" VALUES(X'BBF35130FCF34ED9C7F4E8648230C1B4FE67C7A9',798464,28099);
	INSERT INTO "cblocks" VALUES(X'BBF6C3943260307AA2687CEB610B7A85AE8BABBF',2225672,16387);
	INSERT INTO "cblocks" VALUES(X'BC5A8EC4E542B2235EA8F96E467D928E190FBA8B',61373,32385);
	INSERT INTO "cblocks" VALUES(X'BCE1B7045E98585E126C08C83BFF075248FB5AE6',3323616,26644);
	INSERT INTO "cblocks" VALUES(X'BEAB4BAD3D4CD90BCD3EC165143E5091DE27B912',1567434,23711);
	INSERT INTO "cblocks" VALUES(X'BF2CFEF6A0C76FC97009DBB18A9AEF2DCAAE5465',3465424,19501);
	INSERT INTO "cblocks" VALUES(X'C05156A8658EBEEC8E451513D4FC1307DE7AC289',2427143,98304);
	INSERT INTO "cblocks" VALUES(X'C83C7A9894063C375A98EFC626F3E91B028E6396',974673,15891);
	INSERT INTO "cblocks" VALUES(X'C8534B670E839AC803D6605A3E16CCB9D7E11B1A',920577,21381);
	INSERT INTO "cblocks" VALUES(X'C88D77014695D399B18FDFC28925F45F4B584250',1274122,16571);
	INSERT INTO "cblocks" VALUES(X'CC4D4F5390BA08BEECEDA4CC5082B4837CBC81FD',204239,15687);
	INSERT INTO "cblocks" VALUES(X'D78BD46FBF129E57CB7084EE268F321975C62635',2048722,15270);
	INSERT INTO "cblocks" VALUES(X'D7D6588E159ABC955A4955F81DE7FE5F1CBD9930',4171598,25115);
	INSERT INTO "cblocks" VALUES(X'D9E254DCBED01E8BAE982813512A101A8F1DB60B',3296750,14512);
	INSERT INTO "cblocks" VALUES(X'DA53D345D6B68EBE1602242034183834E49585D0',1158437,16203);
	INSERT INTO "cblocks" VALUES(X'DB8D38E6CFA69E836F4F6E4D7F005A69ACE0D830',4117242,27449);
	INSERT INTO "cblocks" VALUES(X'DF72C04C25C930D0AF684BB65B45BC580E415C25',2242059,18917);
	INSERT INTO "cblocks" VALUES(X'DF95478DD90A1DF934AFC6C18E63490073A94A42',605903,14327);
	INSERT INTO "cblocks" VALUES(X'E07275C32E9B7032E00279C59F2808AECB681E70',1187543,41601);
	INSERT INTO "cblocks" VALUES(X'E37DB1AFAC0EC6A91FE272F55FFA17D6A32318E9',1619100,26135);
	INSERT INTO "cblocks" VALUES(X'E3FA5C6B973AA574EA1798E05C7B6360FA122B19',4085264,15953);
	INSERT INTO "cblocks" VALUES(X'E48E2896AFDAC24FDEAFFA263FB1DA1CB51B46C2',4318122,14246);
	INSERT INTO "cblocks" VALUES(X'E5AAAABC04F21DDD62AD3C4BE17FD98614646905',1964299,14163);
	INSERT INTO "cblocks" VALUES(X'E74031E29ED023123F7C7021396AD64722C8DD44',691656,27852);
	INSERT INTO "cblocks" VALUES(X'EE56D9AF4236E73E9AFBE1FBAF2164D977BFAED9',135261,17763);
	INSERT INTO "cblocks" VALUES(X'EED442757BC7FB55883726F8813ADFE606A91989',3350260,65742);
	INSERT INTO "cblocks" VALUES(X'EF9760700109D39ACA0A1E569E5F35E8202FA567',826563,46494);
	INSERT INTO "cblocks" VALUES(X'F1F9DA295308EFED7B254C7B983456F3636A1E60',1978462,12809);
	INSERT INTO "cblocks" VALUES(X'F43524D1B1FE033AE5843A2B95ABFB94E42DB1A0',2965585,16308);
	INSERT INTO "cblocks" VALUES(X'F442BD868BC2644C5EDEEFFFB0BE58E49F81A8BE',3416002,14824);
	INSERT INTO "cblocks" VALUES(X'F454DA6C26B20703F5E91352A51816EBA2A9F3CE',2525447,55345);
	INSERT INTO "cblocks" VALUES(X'F603DB424EE1B66C2E06DF6859E18FB5755B754F',1065802,51811);
	INSERT INTO "cblocks" VALUES(X'F695EC73734F101EBBCD3D257DC9C8240E696B15',3132351,47932);
	INSERT INTO "cblocks" VALUES(X'F6D5F7EE78E782E69482282C3260DA0E35967C2B',1991271,57451);
	INSERT INTO "cblocks" VALUES(X'F9E0F7A2143014F5CBE41B08C794126F606FE1F4',3825934,18456);
	INSERT INTO "cblocks" VALUES(X'FA703D2F186112C19348C02CB3E98A04B6888FAA',1252499,21623);
	INSERT INTO "cblocks" VALUES(X'FD273E9DCA7350764A6F61BD2D605365BC92DDCE',3019687,92997);
	INSERT INTO "cblocks" VALUES(X'FD91D3B30495BDBFD61607ECD190A63055ECCE2E',1485092,12309);
	CREATE UNIQUE INDEX size_idx
	                        on cblocks(offset)
	                        ;
	COMMIT;
	```
- The values stored in the database `id` attribute of the `cblocks` table match those of the elements of the JSON array stored in `e1.json` and `e2.json`.

### Examined contents of the tar file in the trace directory:

- Expanded the archive tar file `vvpkg.bin`:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ tar -xvvf vvpkg.bin
	drwxrwxrwx tmcphill/tmcphill 0 2020-01-13 18:45 cde-package/
	-rwxrwxrwx tmcphill/tmcphill 543544 2020-01-13 18:45 cde-package/cde-exec
	-rw-rw-rw- tmcphill/tmcphill     91 2020-01-13 18:45 cde-package/cde.uname
	-rwxrwxrwx tmcphill/tmcphill     99 2020-01-13 18:45 cde-package/date.cde
	-rw-rw-rw- tmcphill/tmcphill    749 2020-01-13 18:45 cde-package/provenance.cde-root.1.log
	-rw-rw-rw- tmcphill/tmcphill   1354 2020-01-13 18:45 cde-package/cde.options
	-rw-rw-rw- tmcphill/tmcphill     58 2020-01-13 18:45 cde-package/cde.log
	-rw-rw-rw- tmcphill/tmcphill   2532 2020-01-13 18:45 cde-package/cde.full-environment.cde-root
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/home/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/home/tmcphill/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/home/tmcphill/scratch/
	-rwxrwxrwx tmcphill/tmcphill     43 2020-01-13 18:45 cde-package/cde-root/home/tmcphill/scratch/date.cde
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/etc/
	lrwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/etc/localtime -> ./..//usr/share/zoneinfo/America/Los_Angeles
	-rw-r--r-- root/root          36052 2020-01-13 14:18 cde-package/cde-root/etc/ld.so.cache
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/lib/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/lib/x86_64-linux-gnu/
	-rwxr-xr-x root/root        1689360 2019-02-06 13:17 cde-package/cde-root/lib/x86_64-linux-gnu/libc-2.24.so
	-rwxr-xr-x root/root         153288 2019-02-06 13:17 cde-package/cde-root/lib/x86_64-linux-gnu/ld-2.24.so
	lrwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/lib/x86_64-linux-gnu/libc.so.6 -> libc-2.24.so
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/usr/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/usr/lib/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/usr/lib/locale/
	-rw-r--r-- root/root        1679776 2019-02-12 11:49 cde-package/cde-root/usr/lib/locale/locale-archive
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/usr/share/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/usr/share/zoneinfo/
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/usr/share/zoneinfo/America/
	-rw-r--r-- root/root           2845 2018-10-27 06:20 cde-package/cde-root/usr/share/zoneinfo/America/Los_Angeles
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/lib64/
	lrwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/lib64/ld-linux-x86-64.so.2 -> ./..//lib/x86_64-linux-gnu/ld-2.24.so
	drwxrwxrwx tmcphill/tmcphill      0 2020-01-13 18:45 cde-package/cde-root/bin/
	-rwxr-xr-x root/root         105448 2017-02-22 04:23 cde-package/cde-root/bin/date
	```
- The tar file appears to contain two sets of files.  Those in the `cde-package` directory at the top level of the archive, and those under `cde-package/cde-root` directory.

- The files stored under `cde-package/cde-root` appear to be the files the executions depended on at run time, organized in a directory tree that represents their location in the original file system at run time:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ tree cde-package/cde-root/
	cde-package/cde-root/
	├── bin
	│   └── date
	├── etc
	│   ├── ld.so.cache
	│   └── localtime -> ./..//usr/share/zoneinfo/America/Los_Angeles
	├── home
	│   └── tmcphill
	│       └── scratch
	│           └── date.cde
	├── lib
	│   └── x86_64-linux-gnu
	│       ├── ld-2.24.so
	│       ├── libc-2.24.so
	│       └── libc.so.6 -> libc-2.24.so
	├── lib64
	│   └── ld-linux-x86-64.so.2 -> ./..//lib/x86_64-linux-gnu/ld-2.24.so
	└── usr
	    ├── lib
	    │   └── locale
	    │       └── locale-archive
	    └── share
	        └── zoneinfo
	            └── America
	                └── Los_Angeles
	```
- Whereas files in the top level `cde-package` directory appear to be products of the [CDE](http://www.pgbovine.net/cde.html) system upon which Sciunit is built:
	```
	(sciunit) tmcphill@circe:~/sciunit/sciunit-date$ tree -L 1 cde-package
	cde-package
	├── cde-exec
	├── cde.full-environment.cde-root
	├── cde.log
	├── cde.options
	├── cde-root
	├── cde.uname
	├── date.cde
	└── provenance.cde-root.1.log

	(sciunit) tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ls -l
	total 560
	-rwxr-xr-x 1 tmcphill tmcphill 543544 Jan 13 18:45 cde-exec
	-rw-r--r-- 1 tmcphill tmcphill   2532 Jan 13 18:45 cde.full-environment.cde-root
	-rw-r--r-- 1 tmcphill tmcphill     58 Jan 13 18:45 cde.log
	-rw-r--r-- 1 tmcphill tmcphill   1354 Jan 13 18:45 cde.options
	drwxr-xr-x 8 tmcphill tmcphill   4096 Jan 13 18:45 cde-root
	-rw-r--r-- 1 tmcphill tmcphill     91 Jan 13 18:45 cde.uname
	-rwxr-xr-x 1 tmcphill tmcphill     99 Jan 13 18:45 date.cde
	-rw-r--r-- 1 tmcphill tmcphill    749 Jan 13 18:45 provenance.cde-root.1.log
	```
- The contents of these CDE products require further examination.


### Observations
- There appears to be no record saved here of the system calls made during execution, outside of the CDE products which still require examination.

- The contents of the files stored in the trace directory are fairly opaque, other than the timestamps, commands run, and files accessed by the executions.
 
- Given that the `vvpkg.json` file and `scratch` directory are empty, more complex executions may lead to additional information being recorded.

 
