import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();

import { exchangeCodeWithGitHub } from './auth/exchange_code_for_token';
import { deleteAnonymous } from './auth/on_delete_anonymous';
import { deleteUsers } from './auth/on_delete_users_entry';

// endpoint for exchanging code from github and a secret for an auth token 
export const getAuthTokenFromGitHub = functions.https.onRequest(exchangeCodeWithGitHub);

// delete anonymous account used during sign in and temporarily stored token
export const deleteAnonOnDeleteEntry = functions.firestore.document('anon/{userId}').onCreate(deleteAnonymous);

// delete users in bulk, should be taken out when in production 
export const deleteUsersOnDeleteEntry = functions.firestore.document('delete/{docId}').onCreate(deleteUsers);

