import {COMMAND_CHAT_RESP} from "../costants/remote";

/**
 * 定义聊天数据结构
 * 外层已经包裹messages了
 */
const INITIAL_STATE = {
  "101": [
    {
      "id": "ddddddddddffd",
      "from": "445450",
      "to": "888888888"
    }
  ],
  "002": []
};
export default function messages(state = INITIAL_STATE, action) {
  switch (action.type) {
    case COMMAND_CHAT_RESP:
      let contactId = action.todos[0].from;
      contactId = contactId? contactId: "unknown";
      if (typeof state[contactId] === 'undefined') {
        state[contactId] = [];
      }
      return {
        ...state,
        [contactId]: [
          ...action.todos,
          ...state[contactId]
        ]
      };

    default:
      return state;
  }
}
