CKEDITOR.dialog.add("button",function(t){function e(t){var e=this.getValue();e?(t.attributes[this.id]=e,"name"==this.id&&(t.attributes["data-cke-saved-name"]=e)):(delete t.attributes[this.id],"name"==this.id&&delete t.attributes["data-cke-saved-name"])}return{title:t.lang.forms.button.title,minWidth:350,minHeight:150,onShow:function(){delete this.button;var t=this.getParentEditor().getSelection().getSelectedElement();t&&t.is("input")&&t.getAttribute("type")in{button:1,reset:1,submit:1}&&(this.button=t,this.setupContent(t))},onOk:function(){var t=this.getParentEditor(),e=this.button,n=!e,i=e?CKEDITOR.htmlParser.fragment.fromHtml(e.getOuterHtml()).children[0]:new CKEDITOR.htmlParser.element("input");this.commitContent(i);var a=new CKEDITOR.htmlParser.basicWriter;i.writeHtml(a),i=CKEDITOR.dom.element.createFromHtml(a.getHtml(),t.document),n?t.insertElement(i):(i.replace(e),t.getSelection().selectElement(i))},contents:[{id:"info",label:t.lang.forms.button.title,title:t.lang.forms.button.title,elements:[{id:"name",type:"text",label:t.lang.common.name,default:"",setup:function(t){this.setValue(t.data("cke-saved-name")||t.getAttribute("name")||"")},commit:e},{id:"value",type:"text",label:t.lang.forms.button.text,accessKey:"V",default:"",setup:function(t){this.setValue(t.getAttribute("value")||"")},commit:e},{id:"type",type:"select",label:t.lang.forms.button.type,default:"button",accessKey:"T",items:[[t.lang.forms.button.typeBtn,"button"],[t.lang.forms.button.typeSbm,"submit"],[t.lang.forms.button.typeRst,"reset"]],setup:function(t){this.setValue(t.getAttribute("type")||"")},commit:e}]}]}});