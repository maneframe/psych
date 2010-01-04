module Psych
  ###
  # Psych::Handler is an abstract base class that defines the events used
  # when dealing with Psych::Parser.  Clients who want to use Psych::Parser
  # should implement a class that inherits from Psych::Handler and define
  # events that they can handle.
  #
  # Psych::Handler defines all events that Psych::Parser can possibly send to
  # event handlers.
  #
  # See Psych::Parser for more details
  class Handler
    ###
    # Called with +encoding+ when the YAML stream starts.  This method is
    # called once per stream.  A stream may contain multiple documents.
    #
    # See the constants in Psych::Parser for the possible values of +encoding+.
    def start_stream encoding
    end

    ###
    # Called when the document starts with the declared +version+,
    # +tag_directives+, if the document is +implicit+.
    #
    # +version+ will be an array of integers indicating the YAML version being
    # dealt with, +tag_directives+ is a list of tuples indicating the prefix
    # and suffix of each tag, and +implicit+ is a boolean indicating whether
    # the document is started implicitly.
    #
    # === Example
    #
    # Given the following YAML:
    #
    #   %YAML 1.1
    #   %TAG ! tag:tenderlovemaking.com,2009:
    #   --- !squee
    #
    # The parameters for start_document must be this:
    #
    #   version         # => [1, 1]
    #   tag_directives  # => [["!", "tag:tenderlovemaking.com,2009:"]]
    #   implicit        # => false
    def start_document version, tag_directives, implicit
    end

    ###
    # Called with the document ends.  +implicit+ is a boolean value indicating
    # whether or not the document has an implicit ending.
    #
    # === Example
    #
    # Given the following YAML:
    #
    #   ---
    #     hello world
    #
    # +implicit+ will be true.  Given this YAML:
    #
    #   ---
    #     hello world
    #   ...
    #
    # +implicit+ will be false.
    def end_document implicit
    end

    ###
    # Called when an alias is found to +anchor+.  +anchor+ will be the name
    # of the anchor found.
    #
    # === Example
    #
    # Here we have an example of an array that references itself in YAML:
    #
    #   --- &ponies
    #   - first element
    #   - *ponies
    #
    # &ponies is the achor, *ponies is the alias.  In this case, alias is
    # called with "ponies".
    def alias anchor
    end

    ###
    # Called when a scalar +value+ is found.  The scalar may have an
    # +anchor+, a +tag+, be implicitly +plain+ or implicitly +quoted+
    def scalar value, anchor, tag, plain, quoted, style
    end

    ###
    # Called when a sequence is started.
    def start_sequence anchor, tag, implicit, style
    end

    ###
    # Called when a sequence ends.
    def end_sequence
    end

    ###
    # Called when a map starts
    def start_mapping anchor, tag, implicit, style
    end

    ###
    # Called when a map ends
    def end_mapping
    end

    ###
    # Called when an empty event happens. (Which, as far as I can tell, is
    # never).
    def empty
    end

    ###
    # Called when the YAML stream ends
    def end_stream
    end
  end
end
