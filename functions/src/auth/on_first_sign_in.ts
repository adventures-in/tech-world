import * as admin from 'firebase-admin';
const db = admin.firestore();

export async function saveDetails(user : admin.auth.UserRecord) {

    // ignore anonymous accounts 
    if(user.providerData.length !== 0) {
        // add auth data to the user doc 
        await db.doc('/users/'+user.uid).set({
            'displayName': user.displayName,
            'photoURL': user.photoURL
        }, { merge: true });
    }   
}
