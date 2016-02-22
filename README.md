## Resume.playgound

A fun place to generate Scott Hoyt's resume.

### Usage

* Open up `Resume.playgound`.
* You can use the project navigator to navigate between these instructions and
  the Resume page.
* Running the `Resume` playground page will print my resume in markdown to the
  console.
* Optionally open up the assistant editor and select the timeline view to see
  a sample rendering of the markdown to HTML. (Provided by [Markingbird](https://github.com/kristopherjohnson/Markingbird))
* The pre-generated output is available as `Scott Hoyt Resume.md`.
* The source code used to generate the markdown is in the `Sources` directory
  under `Resume.xcplaygroundpage`

### Implementation Notes

These are some of the techniques utilized:

* Reflection
* Functional Programming
* Protocol Orientated Programming
* Recursion
* Retroactive Modeling via extensions

### Known Issues

* Due to the sandboxed nature of Playgrounds, I cannot write the file to an
  easily accessible location. You can use the file `Scott Hoyt Resume.md` in the
  root directory, or copy and paste the markdown from the playground
  console.
* Some markdown-to-html renderers have difficulty with 3 depths of nested
  unordered lists (`Markingbird` being one). The generated markdown has been
  tested successfully in Atom and on GitHub.

## tl;dr

* Use `Scott Hoyt Resume.md` in the root directory.
