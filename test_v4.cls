// Extract sandbox name from org domain
String sandboxName = '';
Boolean isNPC = false;
String host = URL.getOrgDomainUrl().getHost();
if (host.contains('--')) {
    sandboxName = host.split('--')[1].split('\\.')[0];
    String[] parts = host.split('--');
    String orgPrefix = parts[0];
    // Check if it's NPC
    if (orgPrefix.toLowerCase().contains('navynpc')) {
        isNPC = true;
    }
} else {
    sandboxName = host.split('\\.')[0];
}
System.debug('Sandbox Name: ' + sandboxName);
System.debug('Is NPC? ' + isNPC);
// Define profile
Map<String, Id> profileMap = new Map<String, Id>();
profileMap.put('Admin', [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1].Id);
// Define Role
Map<String, Id> roleMap = new Map<String, Id>();
if(isNPC){
   profileMap.put('MNCC', [SELECT Id FROM Profile WHERE Name = 'MNCC User' LIMIT 1].Id);
   profileMap.put('PRIMS', [SELECT Id FROM Profile WHERE Name = 'PRIMS' LIMIT 1].Id);
   roleMap.put('CPPA', [SELECT Id FROM UserRole WHERE Name = 'CPPA' LIMIT 1].Id);
   roleMap.put('CFL', [SELECT Id FROM UserRole WHERE Name = 'CFL' LIMIT 1].Id);
    
}else{
   profileMap.put('ARM', [SELECT Id FROM Profile WHERE Name = 'ARM User' LIMIT 1].Id);
}
// Define user configurations per environment
Map<String, List<Map<String, Object>>> envUsers = new Map<String, List<Map<String, Object>>>{
    'dev001' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
    'tqa' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest4','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest5','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'NPCTQA3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
     // Tesing user for NRC   
    'test' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Hakan','Last'=>'Admin','Alias'=>'NRCTEST1','Email'=>'Hakan.oran@uuze1hqa.mailosaur.net','Username'=>'hakan.admin@navynrc.mil.my.salesforce.test','Profile'=>'Admin','Role'=>null},
        new Map<String, Object>{'First'=>'Hakan','Last'=>'Oran','Alias'=>'NRCTEST2','Email'=>'Hakan.oran@uuze1hqa.mailosaur.net','Username'=>'hakan.orak.arm@navynrc.mil.test','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Test','Last'=>'Test1','Alias'=>'NRCTEST3','Email'=>'mjubayeer@uuze1hqa.mailosaur.net','Username'=>'mohammod.jubayeer.test2@navynrc.my.salesforce.mil.test','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Test','Last'=>'Test99','Alias'=>'NRCTEST4','Email'=>'mjubayeer@uuze1hqa.mailosaur.net','Username'=>'mohammod.jubayeer.test@navynrc.my.salesforce.mil.test','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Test','Last'=>'Automation1','Alias'=>'NRCTEST5','Email'=>'ecrm.automation@uuze1hqa.mailosaur.net','Username'=>'ecrm.automation@navynrc.mil.test','Profile'=>'ARM','Role'=>null}
    },
     // Tesing user for NRC 
    'dev013' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Jubayeer','Last'=>'Test','Alias'=>'NRC0131','Email'=>'mjubayeer@uuze1hqa.mailosaur.net','Username'=>'mjubayeer1@navynrc.my.salesforce.mil.dev013','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Test','Last'=>'Test1','Alias'=>'NRC0132','Email'=>'mjubayeer@uuze1hqa.mailosaur.net','Username'=>'mjubayeer@navynrc.my.salesforce.mil.dev013','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Test','Last'=>'Test99','Alias'=>'NRC0133','Email'=>'mjubayeer@uuze1hqa.mailosaur.net','Username'=>'mjubayeer99@navynrc.my.salesforce.mil.dev013','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Hakan','Last'=>'OranTest','Alias'=>'NRC0134','Email'=>'Hakan.oran@uuze1hqa.mailosaur.net','Username'=>'hakan.oran@navynrc.mil.my.salesforce.dev013','Profile'=>'ARM','Role'=>null},
        new Map<String, Object>{'First'=>'Test','Last'=>'User1','Alias'=>'NRC0135','Email'=>'ecrm.automation@uuze1hqa.mailosaur.net','Username'=>'worry-press@navynrc.mil.dev013','Profile'=>'ARM','Role'=>null}
    },
       
    'dev018' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
		
     'int' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
      'int2' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
      'test' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
      'test2' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    },
     'tqa2' => new List<Map<String, Object>>{
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test1','Alias'=>'suztest','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu1@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'MNCC','Role'=>'CPPA'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test2','Alias'=>'suztest2','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu2@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'PRIMS','Role'=>'CFL'},
        new Map<String, Object>{'First'=>'Suzie','Last'=>'Test3','Alias'=>'suztest3','Email'=>'susu.hello123@uuze1hqa.mailosaur.net','Username'=>'susu3@navynpc.my.salesforce.com.'+sandboxName,'Profile'=>'Admin','Role'=>null}
    }
};
List<User> usersToInsert = new List<User>();
for (String key : envUsers.keySet()) {
    if (sandboxName.contains(key)) {
        for (Map<String, Object> u : envUsers.get(key)) {
            User newUser = new User(
                FirstName = String.valueOf(u.get('First')),
                LastName = String.valueOf(u.get('Last')),
                Alias = String.valueOf(u.get('Alias')),
                Email = String.valueOf(u.get('Email')),
                Username = String.valueOf(u.get('Username')),
                CommunityNickname = String.valueOf(u.get('Alias')) + Datetime.now().getTime(),
                TimeZoneSidKey = 'America/New_York',
                LocaleSidKey = 'en_US',
                EmailEncodingKey = 'UTF-8',
                LanguageLocaleKey = 'en_US',
                ProfileId = profileMap.get(String.valueOf(u.get('Profile'))),
                Title = 'CPPA',
                CompanyName = 'Salesforce',
                Department = 'MNCC User',
                UserPermissionsInteractionUser = true
               
            );
            if (u.get('Role') != null) {
                newUser.UserRoleId = roleMap.get(String.valueOf(u.get('Role')));
            }
            usersToInsert.add(newUser);
        }
    }
}
if (!usersToInsert.isEmpty()) {
    insert usersToInsert;
    
    // Assign a password to each created user
    for (User u : usersToInsert) {
        System.debug('Create user: ' + u.Username);
        System.setPassword(u.Id, 'MyNPCPassword123!');
        System.debug('Password set for user: ' + u.Username);
    }
}
