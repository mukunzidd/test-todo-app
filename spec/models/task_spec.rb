require 'rails_helper'

RSpec.describe Task, type: :model do

  # Task toggle_favorite test
  describe '#toggle_complete!' do 
    it 'should switch complete to false if it began as true' do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end

  # Task toggle_favorite test
  describe '#toggle_favorite!'
    it 'should switch favorite to false if it began as true' do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it 'should switch favorite to true if it began as false' do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  # Task overdue? test
  describe '#overdue?' do
    it 'should return true if Time.now > deadline!' do
      task = Task.new(deadline: Time.now - 2.hours)
      expect(task.overdue?).to eq(true)
    end

    it 'should return true if Time.now > deadline!' do
      task = Task.new(deadline: Time.now + 2.hours)
      expect(task.overdue?).to eq(false)
    end
  end

  # Task decrement priority! test
  describe '#increment_priority' do
    it 'should return increase priority by 1 if priority is less than ten' do
      task = Task.new(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end
  end

  # Task decrement priority! test
  describe '#decrement_priority' do
    it 'should return increase priority by 1 if priority is less than ten' do
      task = Task.new(priority: 5)
      task.decrement_priority!
      expect(task.priority).to eql(4)
    end
  end

  # Task snooze_hour! test
  describe '#snooze_hour' do
    it 'should return push the deadline by one hour' do
      deadline = Time.now
      task = Task.new(deadline: deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(deadline + 1.hour)
    end
  end
end
