CKEDITOR.dialog.add("checkbox",function(e){return{title:e.lang.forms.checkboxAndRadio.checkboxTitle,minWidth:350,minHeight:140,onShow:function(){delete this.checkbox;var e=this.getParentEditor().getSelection().getSelectedElement();e&&"checkbox"==e.getAttribute("type")&&(this.checkbox=e,this.setupContent(e))},onOk:function(){var e,t=this.checkbox;t||(e=this.getParentEditor(),t=e.document.createElement("input"),t.setAttribute("type","checkbox"),e.insertElement(t)),this.commitContent({element:t})},contents:[{id:"info",label:e.lang.forms.checkboxAndRadio.checkboxTitle,title:e.lang.forms.checkboxAndRadio.checkboxTitle,startupFocus:"txtName",elements:[{id:"txtName",type:"text",label:e.lang.common.name,default:"",accessKey:"N",setup:function(e){this.setValue(e.data("cke-saved-name")||e.getAttribute("name")||"")},commit:function(e){e=e.element,this.getValue()?e.data("cke-saved-name",this.getValue()):(e.data("cke-saved-name",!1),e.removeAttribute("name"))}},{id:"txtValue",type:"text",label:e.lang.forms.checkboxAndRadio.value,default:"",accessKey:"V",setup:function(e){e=e.getAttribute("value"),this.setValue(CKEDITOR.env.ie&&"on"==e?"":e)},commit:function(t){var c=t.element,n=this.getValue();!n||CKEDITOR.env.ie&&"on"==n?CKEDITOR.env.ie?(n=new CKEDITOR.dom.element("input",c.getDocument()),c.copyAttributes(n,{value:1}),n.replace(c),e.getSelection().selectElement(n),t.element=n):c.removeAttribute("value"):c.setAttribute("value",n)}},{id:"cmbSelected",type:"checkbox",label:e.lang.forms.checkboxAndRadio.selected,default:"",accessKey:"S",value:"checked",setup:function(e){this.setValue(e.getAttribute("checked"))},commit:function(t){var c=t.element;if(CKEDITOR.env.ie){var n=!!c.getAttribute("checked"),i=!!this.getValue();n!=i&&(n=CKEDITOR.dom.element.createFromHtml('<input type="checkbox"'+(i?' checked="checked"':"")+"/>",e.document),c.copyAttributes(n,{type:1,checked:1}),n.replace(c),e.getSelection().selectElement(n),t.element=n)}else this.getValue()?c.setAttribute("checked","checked"):c.removeAttribute("checked")}}]}]}});