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

class BundleBusExample extends Component {
  constructor(props) {
    super(props);
    
    let packageJson = require('./package.json');

    this.state = {
      version : packageJson.version
    }
  }

  render() {
    return (
      <View style={styles.container}>
        <Image 
          source={require('./resources/schedulelist_top_icon.png')} />
        <Text style={styles.welcome}>
          BundleBus Client! Version - {this.state.version}
        </Text>
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
