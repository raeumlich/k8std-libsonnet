local buildSummary(results) = {
  SUMMARY: {
    [set]:
      if std.member([val.success for val in std.objectValuesAll(results[set])], false) then
        'failed'
      else
        'success'
    for set in std.objectFieldsAll(results)
  },
  DETAILS: results,
};

{
  run(sets)::
    buildSummary({
      [set]: {
        [test]: {
          success: if self.result == sets[set].tests[test].want then true else false,
          result: sets[set].run(sets[set].tests[test].input),
        }
        for test in std.objectFieldsAll(sets[set].tests)
      }
      for set in std.objectFieldsAll(sets)
    })
}
