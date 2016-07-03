# alfred-slack-workflow
Post message to Slack via Alfred

<img src="https://cloud.githubusercontent.com/assets/1413408/16545937/1712fe9e-4174-11e6-8f1d-04f662617881.gif" width="480"/>

## Usage
1. Download [alfred-slack-workflow.alfredworkflow](https://github.com/morishin/alfred-slack-workflow/releases/download/v1.0/alfred-slack-workflow.alfredworkflow) and open to register the workflow to your Alfred app.
2. Open the workflow directory and edit `env` file to set environment variables.

  <img src="https://cloud.githubusercontent.com/assets/1413408/16546085/84a95308-417a-11e6-925d-c2883d1f028d.png" width="480"/>

3. Edit `env`.

  ```
SLACK_INCOMING_WEBHOOK_URL="https://hooks.slack.com/services/*/*/*"
SLACK_CHANNEL_NAME="#channel-name"
SLACK_USER_NAME="username"
SLACK_ICON_URL="http://your/icon/url.png"
```

4. Type `sl <your message>` in Alfred window.
