require 'rails_helper'

RSpec.describe List, type: :model do

	# COMPLETE ALL TASKS
	describe '#complete_all_tasks!' do
		it 'should return all tasks of a list  with complete true if they started false' do

			# Creating an example
			list = List.new(name: 'Today\'s Chores')
			Task.create(name: 'take out the trash', list_id: list.id, complete: false)
			Task.create(name: 'push up some code', list_id: list.id, complete: false)

			# Trigger Complete all tasks
			list.complete_all_tasks!

			# Test if all tasks in list have complete true
			list.tasks.each do |task|
				expect(task.complete).to eql(true)
			end
		end
	end

	# SNOOZE ALL TASKS
	describe '#snooze_all_tasks' do
		it 'should push the deadline to an hour later' do
			# Creating an example
			deadline = Time.now
			list = List.new(name: 'Today\'s Chores')
			Task.create(name: 'take out the trash', list_id: list.id, deadline: deadline)
			Task.create(name: 'push up some code', list_id: list.id, deadline: deadline)

			# Trigger Complete all tasks
			list.snooze_all_tasks!

			# Test Snooze all tasks
			list.tasks.each do |task|
				expect(task.deadline).to eq(deadline + 1.hour)
			end
		end
	end

	# TOTAL DURATION OF ALL TASKS
	describe '#total_duration' do
		it 'should return the total duration of all tasks of the list' do 
			# Creating an example
			list = List.create(name: 'Today\'s Chores')
			Task.create(name: 'take out the trash', list_id: list.id, duration: 1)
			Task.create(name: 'push up some code', list_id: list.id, duration: 2)

			# Test
			expect(list.total_duration).to eq(3)
		end
	end

	# INCOMPLETE TASKS
	describe '#incomplete_tasks' do
		it 'should return an array of incomplete_tasks' do 
			# Creating an example
			list = List.create(name: 'Today\'s Chores')
			task2 = Task.create(name: 'take out the trash', list_id: list.id, complete: false)
			task3 = Task.create(name: 'push ups', list_id: list.id, complete: false)
			task5 = Task.create(name: 'jogging', list_id: list.id, complete: true)
			task4 = Task.create(name: 'meeting with Joe', list_id: list.id, complete: false)

			# Test
			expect(list.incomplete_tasks).to eq([task2, task3, task4])
		end
	end

	# FAVORITE TASKS
	describe '#favorite_tasks' do
		it 'should an array of favorite_tasks' do 
			# Creating an example
			list = List.create(name: 'Today\'s Chores')
			task2 = Task.create(name: 'take out the trash', list_id: list.id, favorite: false)
			task3 = Task.create(name: 'Meeting Mark', list_id: list.id, favorite: false)
			task5 = Task.create(name: 'push up some code', list_id: list.id, favorite: true)
			task4 = Task.create(name: 'Design a logo', list_id: list.id, favorite: true)

			# Test
			expect(list.favorite_tasks).to eq([task5, task4])
		end
	end

end
