require 'free_disk_space'

[ "/", "c:/", "g:/" ].each { |dir|

amount = FreeDiskSpace.gigabytes(dir)

puts("Amount of disk available on #{dir}:  #{amount} gigabytes")
}
