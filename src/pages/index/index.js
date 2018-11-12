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
import {pushMessage} from "../../actions/messages";


const mapStateToProps = ({messages, ownProps}) => (
  {
    messages,
    ownProps
  }
);

const mapDispatchToProps = (dispatch) => (
  {
    pushMessage(message) {
      dispatch(pushMessage(message))
    }
  }
);

@connect(mapStateToProps, mapDispatchToProps)
export default class Index extends Component {

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
          fixed={true}
          title='导航栏示例'
          leftIconType='chevron-left'
          rightFirstIconType='bullet-list'
          rightSecondIconType='user'
        />
        <View className='message-view'>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
          <Text>fdfd</Text>
        </View>
        <View className='send-view' onClick={this.pushMessage.bind(this, "fdfdfd")}>
          fdfdffffffffffffffffffffffffff
        </View>
      </View>
    )
  }
}


