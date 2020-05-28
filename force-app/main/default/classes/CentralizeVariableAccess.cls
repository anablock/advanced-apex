public class CentralizeVariableAccess {
    private static Boolean userCacheLoaded = false;
    private static Boolean userIsSpecial = false;
    private static String userTimeZone = null;
    
    public static Boolean isUserSpecial() {
        if(userCacheLoaded) {
            return userIsSpecial;
        }
        cacheUserInfo();
        return userIsSpecial;
    }

    public static String userTimeZone() {
        if (userCacheLoaded) {
            return userTimeZone;
        }
        cacheUserInfo();
        return userTimeZone;
    }

    private static void cacheUserInfo() {
        if(userCacheLoaded) {
            return;
        }
        User u = [SELECT UserIsSpecial__c, TimeZoneSidKey
                    FROM User
                    WHERE ID = :UserInfo.getUserId()];
        userIsSpecial = u.UserIsSpecial__c;
        userTimeZone = u.TimeZoneSidKey;
        userCacheLoaded = true;
    }
}

/* 
* With this approach you can cache all necessary information from an object with only one SOQL call.
*/