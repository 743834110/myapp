import Taro, { Component } from '@tarojs/taro'
import {Provider} from '@tarojs/redux';
import Index from './pages/index'
import configStore from './store'
import './app.css'


const store = configStore();
class App extends Component {

  config = {
    pages: [
      'pages/index/index',
      'pages/index2/index',

    ],
    window: {
      backgroundTextStyle: 'light',
      navigationBarBackgroundColor: '#fff',
      navigationBarTitleText: 'WeChat',
      navigationBarTextStyle: 'black'
    }
  }

  componentDidMount () {
    if (process.env.TARO_ENV === "weapp") {
      require("taro-ui/dist/weapp/css/index.css")
    } else if (process.env.TARO_ENV === "h5") {
      require("taro-ui/dist/h5/css/index.css")
    }
  }

  componentDidShow () {}

  componentDidHide () {}

  componentDidCatchError () {}

  // 在 App 类中的 render() 函数没有实际作用
  // 请勿修改此函数
  render () {
    return (
      <Provider store={store}>
        <Index />
      </Provider>
    )
  }
}

Taro.render(
  <App />,
  document.getElementById('app')
)
