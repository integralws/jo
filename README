Javascript-style Object

jo is implemented as a subclass of dict, mapping attribute access
and manipulation into item access and manipulation. 

>>> j = jo()
>>> j.a = 1
>>> j.a
1

>>> print j.b
None

>>> j['b'] = 'b'
>>> j.b += 'e'
>>> print j.b
be

By definition, attributes and items are always the same, as
demonstrated by the invariant:

>>> vars(j) == dict(j)
True

Because jo is a subclass of dict, serializing can be handled simply

>>> import json
>>> print json.dumps(j, sort_keys=True)
{"a": 1, "b": "be"}

This is exactly how string conversion is implemented as well

>>> print j
{"a": 1, "b": "be"}

repr performs in keeping with the python data model description

>>> del j.b

>>> j
jo({'a': 1})

To deserialize from json, simply pass jo as object_hook

>>> print json.loads('{"a":1}', object_hook=jo)
{"a": 1}

As a convenience, the classmethod from_json performs the same task (and
auto-detects whether it is loading from text or from a file)

>>> print jo.from_json('{"a":1}')
{"a": 1}


