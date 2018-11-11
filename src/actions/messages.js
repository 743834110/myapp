import {COMMAND_CHAT_RESP} from "../costants/remote";

export const pushMessage = (respBody) => {
  return {
    type: COMMAND_CHAT_RESP,
    todos: [
      respBody
    ]
  }
};


// 异步action
export function asyncPushMessage(respBody) {
  return (getState, dispatch) => {
    setTimeout(() => {
      dispatch(pushMessage(respBody));
    }, 2000)
  }
}
