import Taro, {Component} from '@tarojs/taro'
import {connect} from '@tarojs/redux'
import {
  View,
  Text,
  ScrollView,
  SwiperItem,
  Swiper,
  Icon,
  Button,
  Progress,
  RichText,
  Input,
  Audio, Image, Video, Camera
} from '@tarojs/components'
import {AtButton, AtNavBar} from 'taro-ui'
import './index.css'

class Index extends Component {

  config = {
    navigationBarTitleText: '首页'
  };

  constructor(props) {
    super(props);
    console.log(props)
  }

  componentWillMount() {
  }

  componentDidMount() {
  }

  componentWillUnmount() {
  }

  componentDidShow() {
  }

  componentDidHide() {
  }

  render() {

    return (
      <View className='box'>
        <AtNavBar
          fixed='true'
          title='导航栏示例'
          leftIconType='chevron-left'
          rightFirstIconType='bullet-list'
          rightSecondIconType='user'
        />
        <View className='next-view'>
          <View className='message-view'>
            fdfdfd
          </View>
          <View className='send-view'>
            fdfd
          </View>
          </View>
        </View>
        )
        }
        }

        export default connect()(Index)

