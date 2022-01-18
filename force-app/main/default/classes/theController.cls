public class theController {

    public theController() {
        selectedTab = 'tab1';
    }
   private string selectedtab;

  public boolean getistab1disabled() {
    return selectedTab != 'tab1';
  }

  public boolean getistab2disabled() {
    return selectedTab != 'tab2';
  }

  public void enabletab1() {
    selectedtab = 'tab1';
  }

  public void enabletab2() {
    selectedtab = 'tab2';
  }

  public string getselectedtab() {
     return selectedtab;
  }
}