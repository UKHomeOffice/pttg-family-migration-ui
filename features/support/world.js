// require OUR APPLICATION THAT WE'RE TESTING
require('../../server.js')
//

require('chromedriver')

var mockdata = require('../step_definitions/mockdata')
var reporter = require('cucumber-html-reporter')
var seleniumWebdriver = require('selenium-webdriver')
var chrome = require('selenium-webdriver/chrome')
var {defineSupportCode} = require('cucumber')
var globalDriver
var path = require('path')
var reportPath = path.resolve('report/')

// config
var shareBrowserInstances = true
var browserName = 'chrome'// usePhantomJS ? 'phantomjs' : 'chrome'
var headless = false
var showReport = false
//

var getNewBrowser = function (name) {
  var builder = new seleniumWebdriver.Builder()
  var opts = new chrome.Options()
  if (headless) {
    opts.addArguments(['headless', 'no-sandbox'])
  }
  opts.addArguments('disable-extensions')
  // opts.setChromeBinaryPath('/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary')
  builder.setChromeOptions(opts)

  var forBrowser = builder.forBrowser(name)

  var driver = forBrowser.build()
  // driver.manage().window().setSize(1280, 1024)
  return driver
}

if (shareBrowserInstances) {
  globalDriver = getNewBrowser(browserName)
}

function CustomWorld (done) {
  mockdata.clearAll()

  this.driver = shareBrowserInstances ? globalDriver : getNewBrowser(browserName)
  this.defaults = {
    applicationRaisedDate: '01/05/2016',
    dependants: '0',
    nino: 'AA123456A'
  }
  this.driver.get('http://127.0.0.1:8000/#!/fs/').then(done)
}

defineSupportCode(function ({setWorldConstructor}) {
  setWorldConstructor(CustomWorld)
})

defineSupportCode(function ({registerHandler}) {
  //
  registerHandler('AfterFeatures', function (features, callback) {
    // globalDriver.close()
    var options = {
      theme: 'foundation',
      jsonFile: path.resolve(path.join(reportPath, 'cucumber_report.json')),
      output: path.resolve(path.join(reportPath, 'cucumber_report.html')),
      reportSuiteAsScenarios: true,
      launchReport: true,
      metadata: {
        // 'App Version': '0.3.2',
        // 'Test Environment': 'STAGING',
        'Browser': 'Chrome'
        // 'Platform': 'Windows 10',
        // 'Parallel': 'Scenarios',
        // 'Executed': 'Remote'
      }
    }

    if (showReport) reporter.generate(options)
    callback()
  })
})