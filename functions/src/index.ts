import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
admin.initializeApp();

import { saveDetails } from './auth/on_first_sign_in';
import { exchangeCodeWithGitHub } from './auth/exchange_code_for_token';
import { deleteUsers } from './auth/on_delete_users_entry';

// when a new account is created, add auth details to the database
export const saveDetailsOnFirstSignIn = functions.auth.user().onCreate(saveDetails);

// endpoint for exchanging code from github and a secret for an auth token 
export const getAuthTokenFromGitHub = functions.https.onRequest(exchangeCodeWithGitHub);

// delete users in bulk, should be taken out when in production 
export const deleteUsersOnDeleteUsersEntry = functions.firestore.document('delete/{docId}').onCreate(deleteUsers);
