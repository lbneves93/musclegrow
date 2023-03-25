# frozen_string_literal: true

p 'Creating exercises categories...'

exercises_categories = [
  { name: 'Abs', img_url: 'https://www.wikihow.com/images/thumb/0/0e/Flex-Abs-Step-1-Version-2.jpg/aid9120875-v4-728px-Flex-Abs-Step-1-Version-2.jpg' },
  { name: 'Aerobic', img_url: 'https://www.wikihow.fitness/images/thumb/9/9a/Run-Track-Step-1-Version-2.jpg/aid839774-v4-728px-Run-Track-Step-1-Version-2.jpg' },
  { name: 'Back', img_url: 'https://www.wikihow.com/images/thumb/2/2d/Treat-a-Backache-Step-1-Version-2.jpg/aid712251-v4-728px-Treat-a-Backache-Step-1-Version-2.jpg' },
  { name: 'Biceps', img_url: 'https://www.wikihow.com/images/thumb/7/71/Measure-Biceps-Step-3-Version-2.jpg/v4-728px-Measure-Biceps-Step-3-Version-2.jpg' },
  { name: 'Chest', img_url: 'https://www.wikihow.com/images/thumb/3/30/Work-Inner-Chest-Step-11.jpg/v4-728px-Work-Inner-Chest-Step-11.jpg' },
  { name: 'Leg', img_url: 'https://www.wikihow.com/images/thumb/7/7a/Get-Stronger-Legs-Step-1-Version-2.jpg/aid666120-v4-728px-Get-Stronger-Legs-Step-1-Version-2.jpg' },
  { name: 'Shoulder', img_url: 'https://www.wikihow.com/images/thumb/0/00/Strengthen-Shoulders-at-Home-Step-2.jpg/aid11781032-v4-728px-Strengthen-Shoulders-at-Home-Step-2.jpg' },
  { name: 'Triceps', img_url: 'https://www.wikihow.com/images/thumb/6/62/Ease-Sore-Muscles-After-a-Hard-Workout-Step-12.jpg/aid1881115-v4-728px-Ease-Sore-Muscles-After-a-Hard-Workout-Step-12.jpg' }
]

exercises_categories.each { |category| ExerciseCategory.find_or_create_by(category) }

p 'Creating exercises...'

exercises = [
  { 
    name: "Squat",
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),                                                             
    img_url: "https://www.wikihow.com/images/thumb/d/d8/Feel-Comfortable-at-a-New-Gym-Step-5-Version-3.jpg/v4-460px-Feel-Comfortable-at-a-New-Gym-Step-5-Version-3.jpg"
  },                                                                     
  { 
    name: "Leg press",
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),                                                         
    img_url: "https://www.wikihow.com/images/thumb/9/92/Use-Gym-Equipment-Step-6-Version-2.jpg/v4-728px-Use-Gym-Equipment-Step-6-Version-2.jpg"
  },
  { 
    name: "Pull up",
    exercise_category: ExerciseCategory.find_by(name: 'Back'),                    
    img_url: "https://www.wikihow.fitness/images/thumb/0/08/Improve-Your-Pull%E2%80%90Ups-Step-1.jpg/aid9477050-v4-728px-Improve-Your-Pull%E2%80%90Ups-Step-1.jpg"
  },                                                                          
  { 
    name: "Bench press",
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),                                                       
    img_url: "https://www.wikihow.com/images/thumb/5/5f/Do-a-Barbell-Bench-Press-Step-4.jpg/aid1741262-v4-728px-Do-a-Barbell-Bench-Press-Step-4.jpg"
  },
  { 
    name: "Triceps Dips",
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: "https://www.wikihow.com/images/thumb/e/e4/Do-Dips-Step-2.jpeg/aid4021346-v4-728px-Do-Dips-Step-2.jpeg"
  },
  { 
    name: "Barbell biceps curls",
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: "https://www.wikihow.fitness/images/thumb/a/a7/Build-Arm-Muscle-with-21s-Step-2-Version-2.jpg/aid8386630-v4-728px-Build-Arm-Muscle-with-21s-Step-2-Version-2.jpg"
  },
  { 
    name: "Bench press inclined",
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: "https://www.wikihow.com/images/thumb/1/11/Do-a-Barbell-Bench-Press-Step-12.jpg/aid1741262-v4-728px-Do-a-Barbell-Bench-Press-Step-12.jpg"
  },
  { 
    name: "Hope pushdown",
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: "https://www.wikihow.com/images/thumb/f/f2/Work-the-Medial-Head-of-Your-Tricep-Step-9.jpg/v4-728px-Work-the-Medial-Head-of-Your-Tricep-Step-9.jpg"
  },
  { 
    name: "Pulldown",
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: "https://www.wikihow.fitness/images/thumb/8/84/Do-a-Lat-Pulldown-Step-3.jpg/aid9313228-v4-728px-Do-a-Lat-Pulldown-Step-3.jpg"
  },
  { 
    name: "Dumbbell bicep curls",
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: "https://www.wikihow.com/images/thumb/9/92/Do-a-Concentration-Curl-Step-10-Version-2.jpg/aid1739383-v4-728px-Do-a-Concentration-Curl-Step-10-Version-2.jpg"
  },
  { 
    name: "Shoulder lateral raise",
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: "https://www.wikihow.com/images/thumb/f/f8/Work-out-With-a-Shoulder-Injury-Step-1-Version-2.jpg/aid1627351-v4-728px-Work-out-With-a-Shoulder-Injury-Step-1-Version-2.jpg"
  },
  { 
    name: "Shoulder front raise",
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: "https://www.wikihow.com/images/thumb/9/92/Work-out-With-a-Shoulder-Injury-Step-3-Version-2.jpg/aid1627351-v4-728px-Work-out-With-a-Shoulder-Injury-Step-3-Version-2.jpg"
  },
  { 
    name: "Plank crunch",
    exercise_category: ExerciseCategory.find_by(name: 'Abs'),
    img_url: "https://www.wikihow.com/images/thumb/9/9c/Get-Six-Pack-Abs-Fast-Step-5-Version-9.jpg/aid415522-v4-728px-Get-Six-Pack-Abs-Fast-Step-5-Version-9.jpg"
  },
  { 
    name: "Basic crunch",
    exercise_category: ExerciseCategory.find_by(name: 'Abs'),
    img_url: "https://www.wikihow.com/images/thumb/e/e4/Get-Six-Pack-Abs-Fast-Step-1-Version-9.jpg/aid415522-v4-728px-Get-Six-Pack-Abs-Fast-Step-1-Version-9.jpg"
  },
  { 
    name: "Bike",
    exercise_category: ExerciseCategory.find_by(name: 'Aerobic'),
    img_url: "https://www.wikihow.com/images/thumb/c/ca/Buy-an-Exercise-Bike-Step-1-Version-3.jpg/aid1470006-v4-728px-Buy-an-Exercise-Bike-Step-1-Version-3.jpg"
  },
  { 
    name: "treadmill",
    exercise_category: ExerciseCategory.find_by(name: 'Aerobic'),
    img_url: "https://www.wikihow.fitness/images/thumb/6/6d/Get-The-Best-Workout-On-a-Treadmill-Step-2-Version-2.jpg/aid3311810-v4-728px-Get-The-Best-Workout-On-a-Treadmill-Step-2-Version-2.jpg"
  }
]

exercises.each {|exercise| Exercise.find_or_create_by(exercise) }