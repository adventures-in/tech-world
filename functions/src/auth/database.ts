import * as admin from 'firebase-admin';
const db = admin.firestore();

export class GitHubToken {
    uid: string;
    token : string;

    constructor(anonymousId: string, token: string) {
        this.uid = anonymousId;
        this.token = token;
    }
    async save() {
        await db.doc(`tokens/${this.uid}`).set({
            'github' : this.token,
        }, {merge: true});
    }
    async failed(failures: any[]) {
        const data = {
            'uid': this.uid,
            'failures': failures
        };
        await db.collection(`users/${this.uid}/processing_failures`).add({
            'type': 'exchange_code_for_tokens',
            'createdOn': admin.firestore.FieldValue.serverTimestamp,
            'message': JSON.stringify(data),
            'data': data
        });
    }
}