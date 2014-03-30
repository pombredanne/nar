{
  rm
  mk
  cwd
  exec
  exists
  expect
  version
} = require './lib/helper'

describe 'CLI', (_) ->

  describe 'create', (_) ->

    describe 'default', (_) ->

      before ->
        mk "#{__dirname}/fixtures/.tmp"
        process.chdir "#{__dirname}/fixtures/.tmp"

      after ->
        rm "#{__dirname}/fixtures/.tmp"
        process.chdir "#{__dirname}/.."

      it 'should create the archive', (done) ->
        exec 'close', <[create]>, ->
          expect exists "#{__dirname}/fixtures/.tmp/nar-#{version}.nar" .to.be.true
          expect it .to.be.equal 0
          done!
