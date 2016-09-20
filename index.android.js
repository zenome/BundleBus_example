/**
 * Copyright (c) 2016-present ZENOME, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Image,
  View
} from 'react-native';

import BundleBus from 'BundleBus-client';

class BundleBusExample extends Component {
  constructor(props) {
    super(props);
    
    let packageJson = require('./package.json');

    this.state = {
      updateType : 'None',
      error : 0,
      errDesc : '-',
      version : packageJson.version
    }


    this.setUpdateType = this.setUpdateType.bind(this);
    this.setErrorType = this.setErrorType.bind(this);
  }

  componentWillMount() {
    BundleBus.init("http://192.168.0.15:3000", this.state.version);
    BundleBus.checkUpdate("d97f2e3c-8d2e-4bb7-ae16-7e082d726fd3", 
        this.setUpdateType,
        this.setErrorType);
  }

  setUpdateType(aType) {
    console.log('called setUpdateType');
    this.setState({updateType: aType});
  }

  setErrorType(aErrorNo, aReason) {
    console.log('called setErrorType');
    this.setState({error : aErrorNo, errDesc: aReason});
  }

  render() {
    return (
      <View style={styles.container}>
        <Image 
          source={require('./resources/schedulelist_top_icon.png')} />
        <Text style={styles.welcome}>
          BundleBus Client!
        </Text>
        <View style={{alignSelf: 'center', margin: 10}}>
          <Text style={styles.instructions}>App version : {this.state.version}</Text>
          <Text style={styles.instructions}>UpdateType - {this.state.updateType}</Text>
          <Text style={styles.instructions}>Error No. - {this.state.errorNo}</Text>
          <Text style={styles.instructions}>Error reason - {this.state.errDesc}</Text>
          <Text style={styles.instructions}>
            If the UpdateType is not 'None', restart current app.{'\n'}
            Then, you can see the updated app.{'\n'}
            Be sure that you have to change version field in package.json when you commit.
          </Text>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('BundleBusExample', () => BundleBusExample);
