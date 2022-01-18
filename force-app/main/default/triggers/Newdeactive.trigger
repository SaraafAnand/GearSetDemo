trigger Newdeactive on User (before update) {
Account_Assigning.afterUpdate( trigger.old);
}