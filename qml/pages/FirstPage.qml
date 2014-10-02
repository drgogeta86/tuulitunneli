/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Tuulitunneli")
            }
            Label {
                x: Theme.paddingLarge
                text: qsTr("A Iodine GUI")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                x: Theme.paddingLarge
                text: "DNS endpoint:"
            }
            TextField {
                id: input_dnsServer
                text: app.dnsServer
                width: page.width
                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: {
                    app.dnsServer = input_dnsServer.text
                    input_dnsServer.focus = true
                }
            }
            Label {
                x: Theme.paddingLarge
                text: "Password:"
            }
            TextField {
                id: input_dnsPasswd
                text: app.dnsPasswd
                width: page.width
                echoMode: TextInput.Password
                inputMethodHints: Qt.ImhNoPredictiveText
                EnterKey.enabled: text.length > 0
                EnterKey.onClicked: {
                    app.dnsPasswd = input_dnsPasswd.text
                    input_dnsPasswd.focus = true
                }
            }
                Button {
                                id: button_enable
                                text: "Start Tunnel"
                                anchors.horizontalCenter: parent.horizontalCenter

                                onClicked: {
                                    // trigger timers to actually do the job
                                    app.enable_timer = !app.tunnel_enabled // enable if it was'nt on
                                    app.disable_timer = app.tunnel_enabled // disable if it was on
                                    app.tunnel_enabled = !app.tunnel_enabled

                                    // change status display
                                    button_enable.text = (app.tunnel_enabled ? "Disable" : "Enable") + " Tunnel"
                                }
            }
        }
    }
}
