
import {createStore, applyMiddleware} from 'redux';
import thunkMiddleware from 'redux-thunk';
import {createLogger} from 'redux-logger';
import rootReducer from '../reducers';

const middlewares = [
  thunkMiddleware,
  createLogger()
];

export default function configStore(lastStore) {
  const store = createStore(
    rootReducer
    , lastStore
    , applyMiddleware(
      ...middlewares
    ))
  return store;
}
