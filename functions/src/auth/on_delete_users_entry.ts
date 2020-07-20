import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

export async function deleteUsers(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

    ///////////////////////////////////////////////////////////////////////
    // Remove all users. 
    // 
    // Relevant references: 
    //  - https://firebase.google.com/docs/reference/admin/node 
    //
    //  When using promises and await, errors need to be caught. Error responses are described here: 
    //  - https://cloud.google.com/storage/docs/json_api/v1/status-codes 
    //  
    ///////////////////////////////////////////////////////////////////////

    try {
        // Delete all users.
        const listUsersResult = await admin.auth().listUsers(1000);
        await admin.auth().deleteUsers(listUsersResult.users.map((record) => record.uid));

        // Delete all documents in a batch.
        const db = admin.firestore();
        const batch = db.batch();
        // users 
        const usersCollection = await db.collection('users').get();
        usersCollection.docs.forEach((doc) => {
            batch.delete(doc.ref);
        });
        // tokens 
        const tokensCollection = await db.collection('tokens').get();
        tokensCollection.docs.forEach((doc) => {
            batch.delete(doc.ref);
        });
        // also delete the doc that triggered the deletes
        batch.delete(snapshot.ref);

        // batch it up 
        await batch.commit();
  
    }
    catch(error) {
        console.error('Uncaught exception: '+error);
    }
}