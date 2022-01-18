/* parentExprController.js */
({
updateParentAttr: function(cmp) {
cmp.set("v.parentAttr", "updated parent attribute");
},
onParentAttrChange: function(cmp, evt) {
console.log("parentAttr was changed");
console.log("old value: " + evt.getParam("oldValue"));
console.log("current value: " + evt.getParam("value"));
}
    
})