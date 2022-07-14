# @param {String[]} emails
# @return {Integer}


=begin 
Every valid email consists of a local name and a domain name, separated by the '@' sign.
Besides lowercase letters, the email may contain one or more '.' or '+'.

For example, in "alice@leetcode.com", "alice" is the local name, and "leetcode.com" is the domain name.
If you add periods '.' between some characters in the local name part of an email address,
mail sent there will be forwarded to the same address without dots in the local name. Note that this rule does not apply to domain names.

For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.
If you add a plus '+' in the local name, everything after the first plus sign will be ignored.
This allows certain emails to be filtered. Note that this rule does not apply to domain names.

For example, "m.y+name@email.com" will be forwarded to "my@email.com".
It is possible to use both of these rules at the same time.

Given an array of strings emails where we send one email to each emails[i], return the number of different addresses that actually receive mails.
=end

def normalize_local_name(local_name)
  local_name_withoud_dot = local_name.gsub(/\./, '')
  local_name_withoud_dot.sub(/\+.*/, '')
end

p normalize_local_name('test.e.mail+bob.cathy@leetcode.com')

def num_unique_emails(emails)
  uniq_emails = {}
  emails.each do |email|
    local_name, domain_name = email.split('@')
    normalized_email = [normalize_local_name(local_name), domain_name].join('@')
    uniq_emails[normalized_email] = true
  end

  uniq_emails.keys.size
end

["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]



p num_unique_emails(['alice.zsdsd+sds@leetcode.com', 'alicezsdsd@leetcode.com', 'adsd@leetcode.com'])