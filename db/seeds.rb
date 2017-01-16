s = Survey.create! completed:    true,
                   printed:      true,
                   starting_pax: 3,
                   in_house:     false,
                   date:         1.week.ago,
                   shift:        '30-1 PM1'

# For posterity, I got these values by running on round-three given a survey s:
#
# include TimeDateMethods
# trip_start_time = interval_to_minutes(s.trip.start_time)
# s.survey_trip_stops.includes(:trip_stop).order(:sequence_number).map do |sts|
#   
#   [(interval_to_minutes(sts.trip_stop.time) - trip_start_time,
#    sts.distance_from_previous.round(3),
#    sts.trip_stop.name]
# end
#
# and manually including the starting trip stop.

[
  [ 0, 0.000, 'Old Belchertown Road'                 ],
  [ 0, 0.242, 'Old Belchertown Road 2'               ],
  [ 1, 0.212, 'Logtown Road (In)'                    ],
  [ 2, 0.473, 'Rolling Green (In)'                   ],
  [ 4, 0.898, 'Colonial Village (In)'                ],
  [ 5, 0.197, 'Colonial Village / S East Street (In)'],
  [ 8, 0.553, 'Amherst Glass (In)'                   ],
  [ 9, 0.297, 'Amherst Crossing (In)'                ],
  [11, 0.248, 'Gray Street (In)'                     ],
  [12, 0.235, 'Churchill Street'                     ],
  [14, 0.320, 'Amherst Post Office'                  ],
  [14, 0.136, 'Pray Street (In)'                     ],
  [16, 0.239, 'Fearing Street (In)'                  ],
  [18, 0.371, 'Studio Arts Building'                 ],
  [19, 0.286, 'Morrill Science Center'               ],
  [19, 0.161, 'Arnold House'                         ],
  [20, 0.275, 'School of Education'                  ],
  [22, 0.451, 'Crestview'                            ],
  [24, 0.324, 'Puffton Village 1'                    ]
].each_with_index do |(minutes, distance, name), index|
  SurveyTripStop.create! boarded:             rand(10),
                         alighted:            rand(10),
                         miles_from_previous: distance,
                         sequence_number:     index,
                         survey:              s,
                         time:                s.date + minutes.minutes,
                         location:            name
end
