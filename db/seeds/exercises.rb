# frozen_string_literal: true

p 'Creating exercises categories...'

exercises_categories = [
  { name: 'Abs',
    img_url: 'https://www.wikihow.com/images/thumb/0/0e/Flex-Abs-Step-1-Version-2.jpg/aid9120875-v4-728px-Flex-Abs-Step-1-Version-2.jpg' },
  { name: 'Aerobic',
    img_url: 'https://www.wikihow.fitness/images/thumb/9/9a/Run-Track-Step-1-Version-2.jpg/aid839774-v4-728px-Run-Track-Step-1-Version-2.jpg' },
  { name: 'Back',
    img_url: 'https://www.wikihow.com/images/thumb/2/2d/Treat-a-Backache-Step-1-Version-2.jpg/aid712251-v4-728px-Treat-a-Backache-Step-1-Version-2.jpg' },
  { name: 'Biceps',
    img_url: 'https://www.wikihow.com/images/thumb/7/71/Measure-Biceps-Step-3-Version-2.jpg/v4-728px-Measure-Biceps-Step-3-Version-2.jpg' },
  { name: 'Chest',
    img_url: 'https://www.wikihow.com/images/thumb/3/30/Work-Inner-Chest-Step-11.jpg/v4-728px-Work-Inner-Chest-Step-11.jpg' },
  { name: 'Leg',
    img_url: 'https://www.wikihow.com/images/thumb/7/7a/Get-Stronger-Legs-Step-1-Version-2.jpg/aid666120-v4-728px-Get-Stronger-Legs-Step-1-Version-2.jpg' },
  { name: 'Shoulder',
    img_url: 'https://www.wikihow.com/images/thumb/0/00/Strengthen-Shoulders-at-Home-Step-2.jpg/aid11781032-v4-728px-Strengthen-Shoulders-at-Home-Step-2.jpg' },
  { name: 'Triceps', img_url: 'https://www.wikihow.com/images/thumb/6/62/Ease-Sore-Muscles-After-a-Hard-Workout-Step-12.jpg/aid1881115-v4-728px-Ease-Sore-Muscles-After-a-Hard-Workout-Step-12.jpg' }
]

exercises_categories.each { |category| ExerciseCategory.find_or_create_by(category) }

p 'Creating exercises...'

exercises = [
  {
    name: 'Squat',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.com/images/thumb/d/d8/Feel-Comfortable-at-a-New-Gym-Step-5-Version-3.jpg/v4-460px-Feel-Comfortable-at-a-New-Gym-Step-5-Version-3.jpg'
  },
  {
    name: 'Leg press',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.com/images/thumb/9/92/Use-Gym-Equipment-Step-6-Version-2.jpg/v4-728px-Use-Gym-Equipment-Step-6-Version-2.jpg'
  },
  {
    name: 'Leg Extension',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.com/images/thumb/a/a9/Do-Leg-Extensions-Step-8.jpg/aid11137799-v4-728px-Do-Leg-Extensions-Step-8.jpg'
  },
  {
    name: 'Hamstring Curl',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.com/images/thumb/1/14/Perform-a-Hamstring-Curl-Step-8.jpg/aid462341-v4-728px-Perform-a-Hamstring-Curl-Step-8.jpg'
  },
  {
    name: 'Calf raises on step',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.com/images/thumb/8/8a/Strengthen-Calf-Muscles-Step-5-Version-2.jpg/aid1390947-v4-728px-Strengthen-Calf-Muscles-Step-5-Version-2.jpg'
  },
  {
    name: 'Hip adduction',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.health/images/thumb/2/2c/Strengthen-Hip-Flexors-Step-8.jpg/aid11264172-v4-728px-Strengthen-Hip-Flexors-Step-8.jpg'
  },
  {
    name: 'Hip abductor',
    exercise_category: ExerciseCategory.find_by(name: 'Leg'),
    img_url: 'https://www.wikihow.com/images/thumb/4/44/Do-a-Sitting-Abductor-Exercise-Step-3-Version-2.jpg/aid1691301-v4-728px-Do-a-Sitting-Abductor-Exercise-Step-3-Version-2.jpg'
  },
  {
    name: 'Pull up',
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: 'https://www.wikihow.fitness/images/thumb/0/08/Improve-Your-Pull%E2%80%90Ups-Step-1.jpg/aid9477050-v4-728px-Improve-Your-Pull%E2%80%90Ups-Step-1.jpg'
  },
  {
    name: 'Pulldown',
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: 'https://www.wikihow.fitness/images/thumb/8/84/Do-a-Lat-Pulldown-Step-3.jpg/aid9313228-v4-728px-Do-a-Lat-Pulldown-Step-3.jpg'
  },
  {
    name: 'Single arm dumbbell row',
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: 'https://www.wikihow.fitness/images/thumb/c/cc/Do-a-One-Arm-Dumbbell-Row-Step-7-Version-2.jpg/aid1741404-v4-728px-Do-a-One-Arm-Dumbbell-Row-Step-7-Version-2.jpg'
  },
  {
    name: 'Smith machine row',
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: 'https://www.wikihow.com/images/thumb/5/57/Do-a-Bent-over-Row-Step-8.jpg/aid276439-v4-728px-Do-a-Bent-over-Row-Step-8.jpg'
  },
  {
    name: 'Seated row',
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: 'https://www.wikihow.com/images/thumb/4/42/Do-a-Seated-Cable-Row-Step-8-Version-3.jpg/v4-728px-Do-a-Seated-Cable-Row-Step-8-Version-3.jpg'
  },
  {
    name: 'Barbell bent over row',
    exercise_category: ExerciseCategory.find_by(name: 'Back'),
    img_url: 'https://www.wikihow.com/images/thumb/1/18/Do-a-Bent-over-Row-Step-3-Version-2.jpg/v4-728px-Do-a-Bent-over-Row-Step-3-Version-2.jpg'
  },
  {
    name: 'Bench press',
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: 'https://www.wikihow.com/images/thumb/5/5f/Do-a-Barbell-Bench-Press-Step-4.jpg/aid1741262-v4-728px-Do-a-Barbell-Bench-Press-Step-4.jpg'
  },
  {
    name: 'Bench press inclined',
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: 'https://www.wikihow.com/images/thumb/1/11/Do-a-Barbell-Bench-Press-Step-12.jpg/aid1741262-v4-728px-Do-a-Barbell-Bench-Press-Step-12.jpg'
  },
  {
    name: 'Cable chest flys',
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: 'https://www.wikihow.fitness/images/thumb/e/e9/Do-Chest-Flies-Step-7.jpg/aid10348947-v4-728px-Do-Chest-Flies-Step-7.jpg'
  },
  {
    name: 'Decline press',
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: 'https://www.wikihow.com/images/thumb/f/fa/Work-Your-Lower-Chest-Step-5-preview.jpg/550px-nowatermark-Work-Your-Lower-Chest-Step-5-preview.jpg'
  },
  {
    name: 'Machine bench press',
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: 'https://www.wikihow.com/images/thumb/4/4f/Do-a-Barbell-Bench-Press-Step-13.jpg/aid1741262-v4-728px-Do-a-Barbell-Bench-Press-Step-13.jpg'
  },
  {
    name: 'Dumbbell Fly',
    exercise_category: ExerciseCategory.find_by(name: 'Chest'),
    img_url: 'https://www.wikihow.com/images/thumb/7/72/Bench-Press-Step-13-Version-2.jpg/aid34273-v4-728px-Bench-Press-Step-13-Version-2.jpg'
  },
  {
    name: 'Triceps Dips',
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: 'https://www.wikihow.com/images/thumb/e/e4/Do-Dips-Step-2.jpeg/aid4021346-v4-728px-Do-Dips-Step-2.jpeg'
  },
  {
    name: 'Hope pushdown',
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: 'https://www.wikihow.com/images/thumb/f/f2/Work-the-Medial-Head-of-Your-Tricep-Step-9.jpg/v4-728px-Work-the-Medial-Head-of-Your-Tricep-Step-9.jpg'
  },
  {
    name: 'Dumbbell triceps extension',
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: 'https://www.wikihow.com/images/thumb/f/f8/Do-a-Tricep-Workout-Step-1.jpeg/aid1703715-v4-728px-Do-a-Tricep-Workout-Step-1.jpeg'
  },
  {
    name: 'Dumbbell triceps kickbacks',
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: 'https://www.wikihow.com/images/thumb/0/00/Do-a-Tricep-Workout-Step-3.jpeg/aid1703715-v4-728px-Do-a-Tricep-Workout-Step-3.jpeg'
  },
  {
    name: 'Pulley triceps',
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: 'https://www.wikihow.com/images/thumb/3/33/Do-a-Tricep-Workout-Step-10.jpeg/aid1703715-v4-728px-Do-a-Tricep-Workout-Step-10.jpeg'
  },
  {
    name: 'Parallel Bars Dips',
    exercise_category: ExerciseCategory.find_by(name: 'Triceps'),
    img_url: 'https://www.wikihow.com/images/thumb/c/c3/Do-Dips-Step-6.jpeg/aid4021346-v4-728px-Do-Dips-Step-6.jpeg'
  },
  {
    name: 'Barbell biceps curls',
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: 'https://www.wikihow.fitness/images/thumb/a/a7/Build-Arm-Muscle-with-21s-Step-2-Version-2.jpg/aid8386630-v4-728px-Build-Arm-Muscle-with-21s-Step-2-Version-2.jpg'
  },
  {
    name: 'Dumbbell bicep curls',
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: 'https://www.wikihow.com/images/thumb/9/92/Do-a-Concentration-Curl-Step-10-Version-2.jpg/aid1739383-v4-728px-Do-a-Concentration-Curl-Step-10-Version-2.jpg'
  },
  {
    name: 'Spider curls',
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: 'https://www.wikihow.fitness/images/thumb/f/f8/Spider-Curl-Step-6-Version-4.jpg/aid9120810-v4-728px-Spider-Curl-Step-6-Version-4.jpg'
  },
  {
    name: 'One arm dumbbell preacher curls',
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: 'https://www.wikihow.fitness/images/thumb/c/cc/Get-Cut-Arms-Step-5.jpeg/aid1408341-v4-728px-Get-Cut-Arms-Step-5.jpeg'
  },
  {
    name: 'Hammer curls',
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: 'https://www.wikihow.fitness/images/thumb/d/dd/Get-Cut-Arms-Step-3.jpeg/aid1408341-v4-728px-Get-Cut-Arms-Step-3.jpeg'
  },
  {
    name: 'Bar cable curls',
    exercise_category: ExerciseCategory.find_by(name: 'Biceps'),
    img_url: 'https://www.wikihow.fitness/images/thumb/b/bc/Spider-Curl-Step-11-Version-4.jpg/aid9120810-v4-728px-Spider-Curl-Step-11-Version-4.jpg'
  },
  {
    name: 'Shoulder lateral raise',
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: 'https://www.wikihow.com/images/thumb/f/f8/Work-out-With-a-Shoulder-Injury-Step-1-Version-2.jpg/aid1627351-v4-728px-Work-out-With-a-Shoulder-Injury-Step-1-Version-2.jpg'
  },
  {
    name: 'Shoulder front raise',
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: 'https://www.wikihow.com/images/thumb/9/92/Work-out-With-a-Shoulder-Injury-Step-3-Version-2.jpg/aid1627351-v4-728px-Work-out-With-a-Shoulder-Injury-Step-3-Version-2.jpg'
  },
  {
    name: 'Overhead press',
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: 'https://www.wikihow.fitness/images/thumb/5/59/Do-an-Overhead-Press-Step-1.jpg/aid10443648-v4-728px-Do-an-Overhead-Press-Step-1.jpg'
  },
  {
    name: 'Dumbbell shoulder press',
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: 'https://www.wikihow.fitness/images/thumb/a/a7/Do-a-Dumbbell-Military-Press-Step-02.jpg/aid12164191-v4-728px-Do-a-Dumbbell-Military-Press-Step-02.jpg'
  },
  {
    name: 'Standing dumbbell shoulder press',
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: 'https://www.wikihow.com/images/thumb/9/98/Dumbbell-Press-Step-11.jpg/aid347163-v4-728px-Dumbbell-Press-Step-11.jpg'
  },
  {
    name: 'Reverse machine fly',
    exercise_category: ExerciseCategory.find_by(name: 'Shoulder'),
    img_url: 'https://www.wikihow.fitness/images/thumb/a/a0/Get-Boulder-Shoulders-Step-10.jpg/aid11638677-v4-728px-Get-Boulder-Shoulders-Step-10.jpg'
  },
  {
    name: 'Plank crunch',
    exercise_category: ExerciseCategory.find_by(name: 'Abs'),
    img_url: 'https://www.wikihow.com/images/thumb/9/9c/Get-Six-Pack-Abs-Fast-Step-5-Version-9.jpg/aid415522-v4-728px-Get-Six-Pack-Abs-Fast-Step-5-Version-9.jpg'
  },
  {
    name: 'Basic crunch',
    exercise_category: ExerciseCategory.find_by(name: 'Abs'),
    img_url: 'https://www.wikihow.com/images/thumb/e/e4/Get-Six-Pack-Abs-Fast-Step-1-Version-9.jpg/aid415522-v4-728px-Get-Six-Pack-Abs-Fast-Step-1-Version-9.jpg'
  },
  {
    name: 'Side crunch',
    exercise_category: ExerciseCategory.find_by(name: 'Abs'),
    img_url: 'https://www.wikihow.com/images/thumb/6/6b/Start-an-Ab-Workout-Step-3-Version-3.jpg/aid170726-v4-728px-Start-an-Ab-Workout-Step-3-Version-3.jpg'
  },
  {
    name: 'Scissors crunch',
    exercise_category: ExerciseCategory.find_by(name: 'Abs'),
    img_url: 'https://www.wikihow.com/images/thumb/f/f9/Start-an-Ab-Workout-Step-4-Version-3.jpg/aid170726-v4-728px-Start-an-Ab-Workout-Step-4-Version-3.jpg'
  },
  {
    name: 'Bike',
    exercise_category: ExerciseCategory.find_by(name: 'Aerobic'),
    img_url: 'https://www.wikihow.com/images/thumb/c/ca/Buy-an-Exercise-Bike-Step-1-Version-3.jpg/aid1470006-v4-728px-Buy-an-Exercise-Bike-Step-1-Version-3.jpg'
  },
  {
    name: 'treadmill',
    exercise_category: ExerciseCategory.find_by(name: 'Aerobic'),
    img_url: 'https://www.wikihow.fitness/images/thumb/6/6d/Get-The-Best-Workout-On-a-Treadmill-Step-2-Version-2.jpg/aid3311810-v4-728px-Get-The-Best-Workout-On-a-Treadmill-Step-2-Version-2.jpg'
  }
]

exercises.each { |exercise| Exercise.find_or_create_by(exercise) }
