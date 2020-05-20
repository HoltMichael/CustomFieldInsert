import { LightningElement } from 'lwc';
import insertField from '@salesforce/apex/InsertCustomFieldUtils.insertField';

export default class InsertCustomField extends LightningElement {
    objectName;
    fieldName;
    fieldLabel;
    fieldDesc;

    updateObjectName(event){
        this.objectName = event.target.value;
    }

    updateFieldName(event){
        this.fieldName = event.target.value;
    }

    updateFieldLabel(event){
        this.fieldLabel = event.target.value;
    }

    updateFieldDesc(event){
        this.fieldDesc = event.target.value;
    }

    insertField(){
        insertField({objectApiName: this.objectName, fieldApiName: this.fieldName, fieldLabel: this.fieldLabel, fieldDescription: this.fieldDesc })
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                console.log(error);
            })
        }


}