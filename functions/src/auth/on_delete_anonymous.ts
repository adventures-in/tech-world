import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

export async function deleteAnonymous(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

    ///////////////////////////////////////////////////////////////////////
    // Remove the anonymous account created during sign in.
    // 
    // Relevant references: 
    //  - https://firebase.google.com/docs/reference/admin/node 
    //
    //  When using promises and await, errors need to be caught. Error responses are described here: 
    //  - https://cloud.google.com/storage/docs/json_api/v1/status-codes 
    //  
    ///////////////////////////////////////////////////////////////////////

    try {
        const db = admin.firestore();
        const uid = context.params.userId;
        
        // delete the doc that was created to trigger the cloud function
        await db.doc('/anon/'+uid).delete();

        // delete temporarily stored token
        await db.doc('/tokens/'+uid).delete();
        
        // delete the account created during anonymous sign in
        await admin.auth().deleteUser(uid);
    }
    catch(error) {
        console.error('Uncaught exception: '+error);
    }
}