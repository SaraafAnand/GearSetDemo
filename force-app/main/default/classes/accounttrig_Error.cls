public class accounttrig_Error {
    public static void Afterinsert(List<Account> accounts){
        User uAdmin=[select id from user where alias=:'Asara'];
        User uWils=[select id from user where alias=:'anan'];
        List<AccountTeamMember> acTeams=new List<AccountTeamMember>();
        System.debug('After insert entered');
        for(account ac:accounts){
            System.debug('Accounts'+ac);
            // if AnnualRevenue is more than  5000000 account team member is created    
            if(ac.AnnualRevenue >50000){
                AccountTeamMember team = new AccountTeamMember();
                team.accountId=ac.id;
                System.debug('teamAccountId====>>>'+team.accountId);
                team.userid=uAdmin.id;
                System.debug('teamAccountId====>>>'+team.userid);
                team.AccountAccessLevel='Read';
                team.ContactAccessLevel='Edit';
                team.TeamMemberRole='AccountManager';
                acTeams.add(team);
                system.debug('Team size====>>>'+acTeams.size());
                system.debug('Teams====>>>'+team);
            }
         insert acTeams;
        }
   
    }
    
}