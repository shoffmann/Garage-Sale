# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_garagesale_session',
  :secret      => 'cb9b673f8b9f69550795382ca907efbb1dd3866d9778bc3c864e207e103b1ff7c2aba938c4ac20a8def6466e7e2b0413e9bc3cb5f67520fccfb40498446ecca6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
