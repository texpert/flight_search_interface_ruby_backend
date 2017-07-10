# frozen_string_literal: true

workers Integer(ENV['WEB_CONCURRENCY'] || 1) unless Gem.win_platform? || defined? JRUBY_VERSION
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

worker_boot_timeout(60 * 5)

plugin 'tmp_restart'
