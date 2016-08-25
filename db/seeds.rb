Location.create!([
  {name: "Seattle", city: "Seattle", state: "WA"},
  {name: "Chicago", city: "Chicago", state: "IL"},
  {name: "San Jose", city: "San Jose", state: "CA"},
  {name: "Web", city: "San Jose", state: "CA"}
])

Alert.create!([
  {cohort_id: nil, location_id: nil, stack_id: nil, message: "Deadline for 3rd stack signup approaching"},
  {cohort_id: nil, location_id: nil, stack_id: nil, message: "The Dojo will be closed Aug 27-Sept 1"},
  {cohort_id: nil, location_id: nil, stack_id: nil, message: "Thursday Tech talk: Alan Summers, stories from my childhood"}
])

Cohort.create!([
  {location_id: 1, start: "2016-05-01", name: "Red Team", active: true, start_date: nil},
  {location_id: 1, start: "2016-06-01", name: "Blue Team", active: true, start_date: nil},
  {location_id: 1, start: "2016-07-01", name: "Green Team", active: true, start_date: nil},
  {location_id: 1, start: "2016-04-01", name: "Yellow Team", active: false, start_date: nil},
  {location_id: 1, start: "2016-03-01", name: "Purple Team", active: false, start_date: nil}
])

Instructor.create!([
  {name: "Carl Snort", email: "csnort@email.com", location_id: 1, linkedin: nil, website: nil, password_digest: "$2a$10$hrSZdD1q6lcBYWZ7J6c.Rerh90e.V9ycrPgoWyud.X5sms08wK8vi", about: "This is a short note about me", admin: true, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, active: true}
])

Language.create!([
  {name: "Python"},
  {name: "Ruby"},
  {name: "Mean"}
])

Stack.create!([
  {instructor_id: 1, language_id: 2, start_date: "2016-08-01", active: true, location_id: 1, total_assignments: nil},
  {instructor_id: 1, language_id: 1, start_date: "2016-08-01", active: true, location_id: 4, total_assignments: nil},
  {instructor_id: 1, language_id: 3, start_date: "2016-09-01", active: false, location_id: 1, total_assignments: nil},
  {instructor_id: 1, language_id: 2, start_date: "2016-07-01", active: false, location_id: 1, total_assignments: nil}
])

Student.create!([
  {name: "Paul", email: "spencer@email.com", password_digest: "$2a$10$cija5.n1GTLa2rLrL/wsz.6BjLHMUHr58btsGPkjJxhK1IDR//tNO", website: nil, linkedin: nil, about: nil, age: nil, active: false, happy: true, help: false, cohort_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: 3},
  {name: "John", email: "spencer@gmail.com", password_digest: "$2a$10$t6Kq1b1Cw/FD0/NttG.J4.HjWCzoStofg5Eh.xXuTSNogof.cyij6", website: nil, linkedin: nil, about: nil, age: nil, active: false, happy: true, help: false, cohort_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: 3},
  {name: "Jessica Parker", email: "jparker7@livejournal.com", password_digest: "$2a$10$WLbOUqVd4pHz2tDoSuc7xOZpwUDM8kUDO4q0ikAXDwmC510mbE2Pe", website: nil, linkedin: nil, about: nil, age: nil, active: false, happy: false, help: false, cohort_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Christopher Hall", email: "chall8@dmoz.org", password_digest: "$2a$10$hBKtxwOkMSKTYSqRruPxweNJqYb2zfb74oAEIlA3mrSR6LUf53mCq", website: nil, linkedin: nil, about: nil, age: nil, active: false, happy: true, help: false, cohort_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Kelly Gonzales", email: "kgonzales9@stanford.edu", password_digest: "$2a$10$90j/73smjfeZpDTxXWUDiewxVo2z83siwqvP96kF.kxX6do7LraJm", website: nil, linkedin: nil, about: nil, age: nil, active: false, happy: true, help: false, cohort_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Randy Grant", email: "rgrant2@geocities.jp", password_digest: "$2a$10$QhM.FUilripow3ArVz.vueRaSreKJssK1B0hmxoXND2MLa3JFhd6K", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: true, help: false, cohort_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Lori Burke", email: "lburke3@wordpress.org", password_digest: "$2a$10$y.RsC6FJ8HnQnm65QFa7xOges4kWzx0/A0vl.s4PH2cXOJ4GYOnLC", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: false, help: false, cohort_id: 3, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Mark Ortiz", email: "mortiz0@youtube.com", password_digest: "$2a$10$0YKE5quv8ViizfBGrGiwVOZm3evTn/1MUHhe8ooHlIy6OJlG2b60a", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: true, help: false, cohort_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Jack Phillips", email: "jphillips1@weebly.com", password_digest: "$2a$10$sU84EZJNNqfsN32gLMtrb.iVpITShPAtIdO64ZfjEO9aHQqHrxSrO", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: false, help: false, cohort_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Phillip Spencer", email: "pspencer4@dot.gov", password_digest: "$2a$10$s.a.P6LxQejowuvQWTMsvOVfvj68UUtVNF8xU7FFxvHCdycNXz116", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: true, help: false, cohort_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Peter Ford", email: "pford5@yahoo.com", password_digest: "$2a$10$bTF4X3e9SiF5KHnAI8udZ.SjyDpk9Hc4OycZhGh.gOByNK09eR2e6", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: false, help: false, cohort_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "Amanda Cole", email: "acole6@imageshack.us", password_digest: "$2a$10$1E.qqGaREpr/EhaXR2Gzieg7aN8KOdfKjKkd1r76Hvv8MlSbwwHGy", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: false, help: false, cohort_id: 2, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: nil},
  {name: "David", email: "spencer@poopmail.com", password_digest: "$2a$10$5cbhO6I5ALYCtiS6bfju1uos.mzqOdGMpJTW8kLeXnCe7oPjpMHea", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: true, help: false, cohort_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: 1},
  {name: "Jun", email: "jun@email.com", password_digest: "$2a$10$Nw0auIuc2GeyihGpt/0XvuMfV26i.GkMv6BFxhD2JiSx6H2CfmQ/m", website: nil, linkedin: nil, about: "`1323r\n", age: 97, active: true, happy: true, help: true, cohort_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: 3},
  {name: "Spencer", email: "spencer@hotmail.com", password_digest: "$2a$10$cax44tj8jt0hJ.3XJzaSJO3kpazN2j8lKCjUokqzmrIB793f5b/Lm", website: nil, linkedin: nil, about: nil, age: nil, active: true, happy: true, help: false, cohort_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: 3},
  {name: "Sam", email: "spencer@emsvsrdvail.com", password_digest: "$2a$10$e4N/PBogZ1l6Hs4.iEFi9uly4Q09Cz2V8KNI9aeeZoNKgntMyKe9a", website: nil, linkedin: nil, about: nil, age: nil, active: false, happy: true, help: false, cohort_id: 4, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil, blackbelt_count: 5}
])

StackStudent.create!([
  {student_id: 1, stack_id: 1, order: 1, belt: "none", assignment_count: nil},
  {student_id: 4, stack_id: 2, order: 1, belt: "black", assignment_count: nil},
  {student_id: 5, stack_id: 2, order: 1, belt: "black", assignment_count: nil},
  {student_id: 6, stack_id: 2, order: 1, belt: "black", assignment_count: nil},
  {student_id: 4, stack_id: 3, order: 2, belt: "black", assignment_count: nil},
  {student_id: 5, stack_id: 3, order: 2, belt: "black", assignment_count: nil},
  {student_id: 6, stack_id: 3, order: 2, belt: "black", assignment_count: nil},
  {student_id: 4, stack_id: 4, order: 3, belt: "black", assignment_count: nil},
  {student_id: 5, stack_id: 4, order: 3, belt: "black", assignment_count: nil},
  {student_id: 6, stack_id: 4, order: 3, belt: "red", assignment_count: nil}
])